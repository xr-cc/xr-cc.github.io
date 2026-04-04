document.addEventListener("DOMContentLoaded", () => {
  const toggle = document.querySelector(".site-header__toggle");
  const nav = document.querySelector(".site-nav");

  if (toggle && nav) {
    toggle.addEventListener("click", () => {
      const expanded = toggle.getAttribute("aria-expanded") === "true";
      toggle.setAttribute("aria-expanded", String(!expanded));
      nav.classList.toggle("is-open", !expanded);
    });
  }

  const viewButtons = document.querySelectorAll("[data-publications-toggle]");
  const views = document.querySelectorAll("[data-publications-view]");

  if (!viewButtons.length || !views.length) {
    return;
  }

  const setActiveView = (viewName) => {
    viewButtons.forEach((button) => {
      const isActive = button.dataset.publicationsToggle === viewName;
      button.classList.toggle("is-active", isActive);
      button.setAttribute("aria-pressed", String(isActive));
    });

    views.forEach((view) => {
      const isActive = view.dataset.publicationsView === viewName;
      view.classList.toggle("publication-view--hidden", !isActive);
    });
  };

  viewButtons.forEach((button) => {
    button.addEventListener("click", () => {
      setActiveView(button.dataset.publicationsToggle);
    });
  });
});
