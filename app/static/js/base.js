// CSRF Token para Fetch API
const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

const originalFetch = window.fetch;
window.fetch = function (...args) {
  let [resource, config] = args;
  if (!config) {
    config = {};
  }
  if (!config.headers) {
    config.headers = {};
  }
  if (config.method && config.method.toUpperCase() !== 'GET') {
    config.headers['X-CSRFToken'] = csrfToken;
  }
  return originalFetch.apply(this, [resource, config]);
};

/* ===== SISTEMA DE TEMAS ===== */
class ThemeManager {
  constructor() {
    this.html = document.documentElement;
    this.toggle = document.getElementById('themeToggle');
    this.icon = document.getElementById('themeIcon');
    this.storageKey = 'theme-preference';

    if (this.toggle) {
      this.init();
    }
  }

  init() {
    // Obtener tema inicial
    const savedTheme = localStorage.getItem(this.storageKey);
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    const initialTheme = savedTheme || (prefersDark ? 'dark' : 'light');

    this.setTheme(initialTheme);

    // Event listener para cambios en preferencia del SO
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
      if (!localStorage.getItem(this.storageKey)) {
        this.setTheme(e.matches ? 'dark' : 'light');
      }
    });

    // Event listener para botón de toggle
    this.toggle.addEventListener('click', () => this.toggleTheme());
  }

  setTheme(theme) {
    const isDark = theme === 'dark';

    if (isDark) {
      this.html.setAttribute('data-theme', 'dark');
      if (this.icon) this.icon.className = 'bi bi-sun-fill';
      if (this.toggle) this.toggle.title = 'Cambiar a tema claro';
    } else {
      this.html.removeAttribute('data-theme');
      if (this.icon) this.icon.className = 'bi bi-moon-stars';
      if (this.toggle) this.toggle.title = 'Cambiar a tema oscuro';
    }

    localStorage.setItem(this.storageKey, theme);
  }

  toggleTheme() {
    const currentTheme = this.html.getAttribute('data-theme');
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
    this.setTheme(newTheme);
  }
}

/* ===== AUTO-HIDE PARA NOTIFICACIONES ===== */
class NotificationManager {
  constructor() {
    this.dismissTime = 3000; // 3 segundos
  }

  init() {
    const alerts = document.querySelectorAll('.alert[data-auto-dismiss="true"]');
    alerts.forEach(alert => {
      this.setupAutoDismiss(alert);
    });
  }

  setupAutoDismiss(alert) {
    // Obtener el nivel de severidad para diferentes tiempos
    let dismissTime = this.dismissTime;
    if (alert.classList.contains('alert-success') || alert.classList.contains('alert-info')) {
      dismissTime = 2500; // Mensajes positivos desaparecen más rápido
    } else if (alert.classList.contains('alert-danger') || alert.classList.contains('alert-warning')) {
      dismissTime = 4000; // Errores se quedan más tiempo
    }

    setTimeout(() => {
      const bsAlert = new bootstrap.Alert(alert);
      bsAlert.close();
    }, dismissTime);
  }
}

// Inicializar cuando el DOM esté listo
document.addEventListener('DOMContentLoaded', () => {
  new ThemeManager();
  const notificationMgr = new NotificationManager();
  notificationMgr.init();
});
