#!/usr/bin/env python
"""
Script para descargar Bootstrap 5.3 localmente.

Uso:
    python scripts/download_bootstrap.py

Descarga Bootstrap de CDN y lo almacena en app/static/vendor/ para
funcionar sin conexión a internet.
"""

import os
import urllib.request
import zipfile
import shutil
from pathlib import Path

# Configuración
BOOTSTRAP_VERSION = "5.3.0"
BOOTSTRAP_URL = f"https://github.com/twbs/bootstrap/releases/download/v{BOOTSTRAP_VERSION}/bootstrap-{BOOTSTRAP_VERSION}-dist.zip"
VENDOR_DIR = Path(__file__).parent.parent / "app" / "static" / "vendor"
BOOTSTRAP_DIR = VENDOR_DIR / "bootstrap"

def download_bootstrap():
    """Descargar Bootstrap desde GitHub."""
    print(f"[*] Descargando Bootstrap {BOOTSTRAP_VERSION}...")

    # Crear directorio vendor si no existe
    VENDOR_DIR.mkdir(parents=True, exist_ok=True)

    zip_path = VENDOR_DIR / f"bootstrap-{BOOTSTRAP_VERSION}.zip"

    try:
        urllib.request.urlretrieve(BOOTSTRAP_URL, zip_path)
        print(f"[OK] Descarga completada: {zip_path}")
    except Exception as e:
        print(f"[ERROR] Error descargando Bootstrap: {e}")
        return False

    return zip_path

def extract_bootstrap(zip_path):
    """Extraer archivos de Bootstrap."""
    print(f"[*] Extrayendo archivos...")

    try:
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            zip_ref.extractall(VENDOR_DIR)

        # Mover carpeta bootstrap-X.X.X a bootstrap
        extracted = list(VENDOR_DIR.glob("bootstrap-*/"))[0]
        if BOOTSTRAP_DIR.exists():
            shutil.rmtree(BOOTSTRAP_DIR)
        extracted.rename(BOOTSTRAP_DIR)

        print(f"[OK] Extraccion completada: {BOOTSTRAP_DIR}")
        return True
    except Exception as e:
        print(f"[ERROR] Error extrayendo: {e}")
        return False

def verify_files():
    """Verificar que archivos críticos existen."""
    print("[*] Verificando archivos...")

    critical_files = [
        BOOTSTRAP_DIR / "css" / "bootstrap.min.css",
        BOOTSTRAP_DIR / "js" / "bootstrap.bundle.min.js",
    ]

    missing = []
    for file_path in critical_files:
        if file_path.exists():
            print(f"  [OK] {file_path.relative_to(VENDOR_DIR)}")
        else:
            missing.append(file_path)
            print(f"  [XX] {file_path.relative_to(VENDOR_DIR)} - FALTA")

    return len(missing) == 0

def create_fallback_template():
    """Crear plantilla con fallback a CDN."""
    fallback_template = '''<!-- Bootstrap: Local + CDN Fallback -->
{% if use_local_bootstrap %}
    <link rel="stylesheet" href="{{ url_for('static', filename='vendor/bootstrap/css/bootstrap.min.css') }}">
{% else %}
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
{% endif %}

<!-- Scripts -->
{% if use_local_bootstrap %}
    <script src="{{ url_for('static', filename='vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
{% else %}
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
{% endif %}

<!-- Fallback: Si CDN no cargó, usar local -->
<script>
if (!window.bootstrap) {
    document.write('<script src="{{ url_for("static", filename="vendor/bootstrap/js/bootstrap.bundle.min.js") }}"><\\/script>');
}
</script>
'''

    template_path = Path(__file__).parent.parent / "app" / "templates" / "_bootstrap_fallback.html"
    template_path.parent.mkdir(parents=True, exist_ok=True)

    with open(template_path, 'w') as f:
        f.write(fallback_template)

    print(f"[OK] Plantilla de fallback creada: {template_path}")

def cleanup(zip_path):
    """Limpiar archivos temporales."""
    if zip_path.exists():
        os.remove(zip_path)
        print(f"[OK] Limpieza completada")

def main():
    """Función principal."""
    print("=" * 60)
    print(f"Bootstrap Downloader v1.0")
    print("=" * 60)

    # Descargar
    zip_path = download_bootstrap()
    if not zip_path:
        return False

    # Extraer
    if not extract_bootstrap(zip_path):
        return False

    # Verificar
    if not verify_files():
        print("[!] Advertencia: Algunos archivos pueden estar faltando")
        return False

    # Crear plantilla de fallback
    create_fallback_template()

    # Limpiar
    cleanup(zip_path)

    print("\n" + "=" * 60)
    print("[OK] Bootstrap descargado exitosamente")
    print("=" * 60)
    print("\nProximos pasos:")
    print("1. Actualizar templates para usar local + CDN fallback")
    print("2. Probar que Bootstrap carga sin internet")
    print("3. Considerar hacer offline-first en config")
    print("\nArchivos guardados en:")
    print(f"  {BOOTSTRAP_DIR}/")

    return True

if __name__ == "__main__":
    import sys
    success = main()
    sys.exit(0 if success else 1)
