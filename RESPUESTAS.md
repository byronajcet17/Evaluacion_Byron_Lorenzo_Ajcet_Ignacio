# Fundamentos de Inteligencia Artificial

## Pregunta 1

La integración del modelo de inteligencia artificial se realizaría como una etapa adicional dentro del flujo de procesamiento de una postulación.

El backend recibiría la carta de presentación y la información de las habilidades requeridas por la vacante. Posteriormente podría enviar estos datos a un servicio de IA mediante una API.

El modelo debería devolver una estructura controlada, por ejemplo:

```json
{
  "skills": [
    "Node.js",
    "SQL",
    "REST API"
  ]
}
