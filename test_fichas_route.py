#!/usr/bin/env python
"""Test if fichas routes are registered"""

from app import create_app

app = create_app()

print("App created successfully")
print("\nFichas routes:")
found = False
for rule in app.url_map.iter_rules():
    if 'fichas' in str(rule):
        print(f"  {rule}")
        found = True

if not found:
    print("  ❌ NO FICHAS ROUTES FOUND!")
    print("\nAll registered routes:")
    for rule in app.url_map.iter_rules():
        print(f"  {rule}")
else:
    print("\n✅ Fichas routes are registered")
