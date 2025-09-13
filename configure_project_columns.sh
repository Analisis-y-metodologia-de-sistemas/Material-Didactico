#!/bin/bash

# Script para configurar las columnas del proyecto Kanban
# Ejecutar después de setup_github_project.sh

ORG="Analisis-y-metodologia-de-sistemas"
PROJECT_NUMBER="2"

echo "📋 Configurando columnas del proyecto Kanban..."
echo "Organización: $ORG"
echo "Proyecto: #$PROJECT_NUMBER"
echo ""

# Verificar que gh CLI está autenticado
if ! gh auth status > /dev/null 2>&1; then
    echo "❌ GitHub CLI no está autenticado. Ejecuta: gh auth login"
    exit 1
fi

echo "📊 Moviendo issues a las columnas correctas..."
echo "============================================="

# Función para mover issue a una columna específica
move_issue_to_column() {
    local issue_number="$1"
    local column_name="$2"
    local issue_title="$3"
    
    echo "📌 Moviendo LISCOV-$issue_number ($issue_title) → $column_name"
    
    # Obtener el ID del issue
    issue_id=$(gh issue view $issue_number --repo "$ORG/Material-Didactico" --json id --jq '.id')
    
    if [ ! -z "$issue_id" ]; then
        # Mover el issue a la columna correcta usando el project CLI
        gh project item-edit --owner $ORG --id $issue_id --project-id $PROJECT_NUMBER --field "Status" --value "$column_name"
        echo "✅ Movido exitosamente"
    else
        echo "❌ No se pudo obtener el ID del issue #$issue_number"
    fi
    echo ""
}

# TODO (Backlog)
echo "🔵 Configurando columna: TODO"
move_issue_to_column "243" "Todo" "Critical login bug"
move_issue_to_column "249" "Todo" "User progress API"
move_issue_to_column "252" "Todo" "Database optimization"

# IN PROGRESS
echo "🟡 Configurando columna: IN PROGRESS"
move_issue_to_column "247" "In Progress" "UI/UX mejoras"
move_issue_to_column "248" "In Progress" "API refactor"

# CODE REVIEW
echo "🟣 Configurando columna: CODE REVIEW"
move_issue_to_column "251" "In Review" "Responsive dashboard"
move_issue_to_column "265" "In Review" "Code review process improvements"

# TESTING
echo "🟠 Configurando columna: TESTING"
move_issue_to_column "245" "In Review" "Auth service fix"
move_issue_to_column "290" "In Review" "Testing improvements"

# DONE
echo "🟢 Configurando columna: DONE"
move_issue_to_column "240" "Done" "Sprint planning facilitation"
move_issue_to_column "244" "Done" "Deploy pipeline"
move_issue_to_column "275" "Done" "Performance monitoring"
move_issue_to_column "287" "Done" "Documentation updates"
move_issue_to_column "301" "Done" "Quick UI fixes"
move_issue_to_column "302" "Done" "Minor bug fixes"

# Issues especiales
echo "⚠️ Issues que requieren atención especial:"
move_issue_to_column "280" "In Progress" "User feedback integration (8 días - requiere atención)"
move_issue_to_column "289" "In Progress" "Performance optimization (14.5 días - fuera de control)"

echo ""
echo "🎉 ¡Configuración de columnas completada!"
echo ""
echo "📊 Resumen del proyecto:"
echo "├── 📋 TODO (3 items)"
echo "│   ├── LISCOV-243: Critical login bug"
echo "│   ├── LISCOV-249: User progress API"
echo "│   └── LISCOV-252: Database optimization"
echo "├── 🔄 IN PROGRESS (4 items)"
echo "│   ├── LISCOV-247: UI/UX mejoras (Día 3/5)"
echo "│   ├── LISCOV-248: API refactor (Día 2/7)"
echo "│   ├── LISCOV-280: User feedback (8 días ⚠️)"
echo "│   └── LISCOV-289: Performance optimization (14.5 días 🚨)"
echo "├── 👀 CODE REVIEW (2 items)"
echo "│   ├── LISCOV-251: Responsive dashboard"
echo "│   └── LISCOV-265: Code review improvements (12 días 🚨)"
echo "├── 🧪 TESTING (2 items)"
echo "│   ├── LISCOV-245: Auth service fix"
echo "│   └── LISCOV-290: Testing improvements"
echo "└── ✅ DONE (6 items)"
echo "    ├── LISCOV-240: Sprint planning facilitation"
echo "    ├── LISCOV-244: Deploy pipeline"
echo "    ├── LISCOV-275: Performance monitoring"
echo "    ├── LISCOV-287: Documentation updates"
echo "    ├── LISCOV-301: Quick UI fixes"
echo "    └── LISCOV-302: Minor bug fixes"
echo ""
echo "🔗 Ver proyecto: https://github.com/orgs/$ORG/projects/$PROJECT_NUMBER"
echo ""
echo "⚙️ Configuraciones recomendadas:"
echo "1. Configurar WIP limits por columna:"
echo "   - TODO: Sin límite"
echo "   - IN PROGRESS: 3-4 items máximo"
echo "   - CODE REVIEW: 2 items máximo"
echo "   - TESTING: 2 items máximo"
echo "   - DONE: Sin límite"
echo ""
echo "2. Configurar automations:"
echo "   - Auto-mover issues cerrados a DONE"
echo "   - Notificar cuando items excedan SLA"
echo "   - Auto-asignar reviewers por área"