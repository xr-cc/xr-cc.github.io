#!/usr/bin/env ruby

require "csv"
require "date"
require "yaml"

ROOT = File.expand_path("..", __dir__)

SCHEMAS = {
  "_data/profile.yml" => %w[name role affiliation email avatar about research_interests links announcements],
}.freeze

PUBLICATIONS_TABLE = "_data/publications.tsv"
PROJECTS_TABLE = "_data/projects.tsv"
TALKS_TABLE = "_data/talks.tsv"
TEACHING_TABLE = "_data/teaching.tsv"
PUBLICATION_FIELDS = %w[id status selected date year type title authors venue].freeze
PROJECT_FIELDS = %w[id status featured title summary image].freeze
TALK_FIELDS = %w[id status date year type title venue location summary].freeze
TEACHING_FIELDS = %w[id status years type title institution location summary].freeze

def load_yaml(path)
  YAML.safe_load(File.read(path), permitted_classes: [Date], aliases: false)
rescue StandardError => e
  abort("Failed to parse #{path}: #{e.message}")
end

def ensure_fields!(path, items, required_fields)
  unless items.is_a?(Array)
    abort("#{path} must contain a top-level list.")
  end

  items.each_with_index do |item, index|
    unless item.is_a?(Hash)
      abort("#{path} entry #{index + 1} must be a mapping.")
    end

    missing = required_fields.reject do |field|
      value = item[field]
      !value.nil? && !(value.respond_to?(:empty?) && value.empty?)
    end

    next if missing.empty?

    abort("#{path} entry #{index + 1} is missing required field(s): #{missing.join(', ')}")
  end
end

def validate_publications_table!(project_ids = nil)
  path = File.join(ROOT, PUBLICATIONS_TABLE)
  rows = CSV.read(path, headers: true, col_sep: "\t")
  abort("#{PUBLICATIONS_TABLE} must include at least one publication row.") if rows.empty?

  missing_headers = PUBLICATION_FIELDS.reject { |field| rows.headers.include?(field) }
  abort("#{PUBLICATIONS_TABLE} is missing required column(s): #{missing_headers.join(', ')}") unless missing_headers.empty?

  rows.each_with_index do |row, index|
    missing = PUBLICATION_FIELDS.reject do |field|
      value = row[field]
      !value.nil? && !value.strip.empty?
    end
    abort("#{PUBLICATIONS_TABLE} row #{index + 2} is missing required field(s): #{missing.join(', ')}") unless missing.empty?

    unless %w[published pending hidden].include?(row["status"])
      abort("#{PUBLICATIONS_TABLE} row #{index + 2} has invalid status: #{row['status']}")
    end

    unless %w[true false].include?(row["selected"])
      abort("#{PUBLICATIONS_TABLE} row #{index + 2} has invalid selected value: #{row['selected']}")
    end

    begin
      Date.iso8601(row["date"])
    rescue StandardError
      abort("#{PUBLICATIONS_TABLE} row #{index + 2} has invalid ISO date: #{row['date']}")
    end

    next if project_ids.nil? || row["project_ids"].nil? || row["project_ids"].strip.empty?

    row["project_ids"].split(" | ").each do |project_id|
      next if project_ids.include?(project_id)

      abort("#{PUBLICATIONS_TABLE} row #{index + 2} references unknown project id: #{project_id}")
    end
  end
end

def validate_projects_table!(publication_ids)
  path = File.join(ROOT, PROJECTS_TABLE)
  rows = CSV.read(path, headers: true, col_sep: "\t")
  abort("#{PROJECTS_TABLE} must include at least one project row.") if rows.empty?

  missing_headers = PROJECT_FIELDS.reject { |field| rows.headers.include?(field) }
  abort("#{PROJECTS_TABLE} is missing required column(s): #{missing_headers.join(', ')}") unless missing_headers.empty?

  rows.each_with_index do |row, index|
    missing = PROJECT_FIELDS.reject do |field|
      value = row[field]
      !value.nil? && !value.strip.empty?
    end
    abort("#{PROJECTS_TABLE} row #{index + 2} is missing required field(s): #{missing.join(', ')}") unless missing.empty?

    unless %w[published pending hidden].include?(row["status"])
      abort("#{PROJECTS_TABLE} row #{index + 2} has invalid status: #{row['status']}")
    end

    unless %w[true false].include?(row["featured"])
      abort("#{PROJECTS_TABLE} row #{index + 2} has invalid featured value: #{row['featured']}")
    end

    next if row["publication_ids"].nil? || row["publication_ids"].strip.empty?

    row["publication_ids"].split(" | ").each do |publication_id|
      next if publication_ids.include?(publication_id)

      abort("#{PROJECTS_TABLE} row #{index + 2} references unknown publication id: #{publication_id}")
    end
  end
end

def validate_talks_table!(project_ids, publication_ids)
  path = File.join(ROOT, TALKS_TABLE)
  rows = CSV.read(path, headers: true, col_sep: "\t")
  abort("#{TALKS_TABLE} must include at least one talk row.") if rows.empty?

  missing_headers = TALK_FIELDS.reject { |field| rows.headers.include?(field) }
  abort("#{TALKS_TABLE} is missing required column(s): #{missing_headers.join(', ')}") unless missing_headers.empty?

  rows.each_with_index do |row, index|
    missing = TALK_FIELDS.reject do |field|
      value = row[field]
      !value.nil? && !value.strip.empty?
    end
    abort("#{TALKS_TABLE} row #{index + 2} is missing required field(s): #{missing.join(', ')}") unless missing.empty?

    unless %w[published pending hidden].include?(row["status"])
      abort("#{TALKS_TABLE} row #{index + 2} has invalid status: #{row['status']}")
    end

    begin
      Date.iso8601(row["date"])
    rescue StandardError
      abort("#{TALKS_TABLE} row #{index + 2} has invalid ISO date: #{row['date']}")
    end

    if row["project_ids"] && !row["project_ids"].strip.empty?
      row["project_ids"].split(" | ").each do |project_id|
        next if project_ids.include?(project_id)
        abort("#{TALKS_TABLE} row #{index + 2} references unknown project id: #{project_id}")
      end
    end

    if row["publication_ids"] && !row["publication_ids"].strip.empty?
      row["publication_ids"].split(" | ").each do |publication_id|
        next if publication_ids.include?(publication_id)
        abort("#{TALKS_TABLE} row #{index + 2} references unknown publication id: #{publication_id}")
      end
    end
  end
end

def validate_teaching_table!
  path = File.join(ROOT, TEACHING_TABLE)
  rows = CSV.read(path, headers: true, col_sep: "\t")
  abort("#{TEACHING_TABLE} must include at least one teaching row.") if rows.empty?

  missing_headers = TEACHING_FIELDS.reject { |field| rows.headers.include?(field) }
  abort("#{TEACHING_TABLE} is missing required column(s): #{missing_headers.join(', ')}") unless missing_headers.empty?

  rows.each_with_index do |row, index|
    missing = TEACHING_FIELDS.reject do |field|
      value = row[field]
      !value.nil? && !value.strip.empty?
    end
    abort("#{TEACHING_TABLE} row #{index + 2} is missing required field(s): #{missing.join(', ')}") unless missing.empty?

    unless %w[published pending hidden].include?(row["status"])
      abort("#{TEACHING_TABLE} row #{index + 2} has invalid status: #{row['status']}")
    end
  end
end

SCHEMAS.each do |relative_path, required_fields|
  full_path = File.join(ROOT, relative_path)
  data = load_yaml(full_path)

  if relative_path == "_data/profile.yml"
    unless data.is_a?(Hash)
      abort("#{relative_path} must contain a top-level mapping.")
    end

    missing = required_fields.reject do |field|
      value = data[field]
      !value.nil? && !(value.respond_to?(:empty?) && value.empty?)
    end
    abort("#{relative_path} is missing required field(s): #{missing.join(', ')}") unless missing.empty?
    next
  end

  ensure_fields!(relative_path, data, required_fields)
end

publication_ids = CSV.read(File.join(ROOT, PUBLICATIONS_TABLE), headers: true, col_sep: "\t").map { |row| row["id"] }
project_ids = CSV.read(File.join(ROOT, PROJECTS_TABLE), headers: true, col_sep: "\t").map { |row| row["id"] }
validate_publications_table!(project_ids)
validate_projects_table!(publication_ids)
validate_talks_table!(project_ids, publication_ids)
validate_teaching_table!

puts "Data validation passed."
