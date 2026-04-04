# Xiran Liu Academic Website

This staged redesign keeps the site on Jekyll, but shifts the content model away from the inherited `academicpages` template and toward a small set of editable data files.

## What changed

- A custom homepage and section pages replaced the stock academic-pages layout.
- Navigation is simplified to `Home`, `Projects`, `Publications`, `Talks`, and `Teaching`.
- Repeated content now lives in `_data/*` files, including a spreadsheet-style publications table.
- A validation script and GitHub Actions workflow check the structured content on every push.

## Where to edit content

- `_data/profile.yml`: bio, links, announcements, homepage metrics
- `_data/projects.tsv`: master research-project table
- `_data/publications.tsv`: master publications table
- `_data/talks.tsv`: talks and presentations table
- `_data/teaching.tsv`: teaching and workshop history table
- `files/`: downloadable assets such as the CV or paper PDFs

## Local development

1. Install dependencies:

   ```bash
   ruby -v  # use Ruby 3.2+ rather than the macOS system Ruby 2.6
   bundle install
   ```

2. Validate the site data:

   ```bash
   ruby scripts/validate_data.rb
   ```

3. Run the site locally:

   ```bash
   bundle exec jekyll serve
   ```

## Maintenance notes

- Publication entries are stored in one TSV table. Edit rows manually and set `status` to `published`, `pending`, or `hidden` as needed.
- Use the `selected` column to control which papers appear in the homepage `Selected work` section.
- Research projects are stored in a second TSV table. Use `project_ids` in publications and `publication_ids` in projects for many-to-many linking.
- Talks and teaching are also table-driven now, so ongoing updates are simple row edits rather than schema-specific YAML changes.
- The data files are intended to be the canonical content source for the redesigned site.
- Legacy folders from the original template are still present in this staged copy, but the new pages no longer depend on them.
