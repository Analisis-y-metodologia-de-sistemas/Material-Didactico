#!/bin/bash

# Script para agregar los issues creados al proyecto GitHub
# Ejecutar: bash add_to_project.sh

ORG="Analisis-y-metodologia-de-sistemas"
REPO="Material-Didactico"
PROJECT_NUMBER="2"

echo "📋 Agregando issues al proyecto GitHub..."
echo "Organización: $ORG"
echo "Repositorio: $REPO" 
echo "Proyecto: #$PROJECT_NUMBER"
echo ""

# Función para agregar issue al proyecto
add_to_project() {
    local issue_number="$1"
    local issue_title="$2"
    
    echo "📌 Agregando issue #$issue_number: $issue_title"
    
    # Obtener la URL del issue
    issue_url="https://github.com/$ORG/$REPO/issues/$issue_number"
    
    # Agregar al proyecto usando gh CLI
    gh project item-add $PROJECT_NUMBER --owner $ORG --url "$issue_url"
    
    if [ $? -eq 0 ]; then
        echo "✅ Issue #$issue_number agregado al proyecto"
    else
        echo "❌ Error agregando issue #$issue_number"
    fi
    echo ""
}

echo "🏗️ Agregando todos los issues LISCOV..."
echo "======================================"

# Agregar todos los issues creados
add_to_project "3" "LISCOV-243: Critical login bug"
add_to_project "4" "LISCOV-247: UI/UX mejoras"
add_to_project "5" "LISCOV-289: Performance optimization"
add_to_project "6" "LISCOV-265: Code review process improvements"
add_to_project "7" "LISCOV-248: API refactor"
add_to_project "8" "LISCOV-251: Responsive dashboard"
add_to_project "9" "LISCOV-245: Auth service fix"
add_to_project "10" "LISCOV-244: Deploy pipeline (DONE)"
add_to_project "11" "LISCOV-280: User feedback integration"

echo ""
echo "🎉 ¡Issues agregados al proyecto!"
echo ""
echo "🔗 Ver proyecto: https://github.com/orgs/$ORG/projects/$PROJECT_NUMBER"
echo ""
echo "📊 Próximos pasos:"
echo "1. Ve al proyecto en GitHub"
echo "2. Organiza los issues en las columnas correctas:"
echo "   - TODO: LISCOV-243 (Critical login bug)"
echo "   - IN PROGRESS: LISCOV-247, LISCOV-248, LISCOV-280, LISCOV-289"
echo "   - CODE REVIEW: LISCOV-251, LISCOV-265"
echo "   - TESTING: LISCOV-245"
echo "   - DONE: LISCOV-244"
echo "3. Configura automations y WIP limits"
echo ""
echo "🎯 Tu proyecto ahora tiene ejemplos reales de Kanban que coinciden"
echo "   perfectamente con los de la página HTML educativa!"