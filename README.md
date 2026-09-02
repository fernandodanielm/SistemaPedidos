# Sistema de pedidos - Sabor Kiosco

## Tipo de proyecto
Sistema de pedidos para gestión operativa del local.

## 1. Resumen ejecutivo
El presente proyecto propone un sistema de gestión de pedidos para Sabor Kiosco, orientado a automatizar y ordenar la operación del negocio desde la toma del pedido hasta la entrega final al cliente. La solución se centra en un MVP funcional, con enfoque en rapidez de implementación, usabilidad operativa y trazabilidad de procesos. El objetivo principal es reducir errores, mejorar la coordinación entre mostrador y cocina y facilitar el control del estado de cada pedido.

## 2. Introducción
La gestión del negocio requiere un flujo más eficiente y consistente para atender pedidos con personalizaciones, combos y seguimiento del estado. Actualmente, la operación puede verse afectada por errores en la carga de información, falta de sincronización entre sectores y dificultad para controlar modificaciones o cancelaciones. Con el sistema propuesto, se busca digitalizar esta operación para mejorar la experiencia del cliente y la productividad interna del local.

## 3. Objetivo del sistema
El sistema debe permitir al local:
- tomar pedidos con personalizaciones y combos,
- enviar automáticamente la información a cocina,
- visualizar el estado del pedido,
- modificar pedidos activos antes de la preparación,
- cancelar pedidos cuando corresponda,
- identificar el pedido para retiro,
- registrar el pago,
- mantener trazabilidad básica de las operaciones.

## 4. Alcance del MVP
### Funcionalidades incluidas
- RF1: toma de pedidos con personalizaciones y combos.
- RF2: envío automático de comandas a cocina.
- RF3: seguimiento del estado del pedido.
- RF4: modificación de pedidos activos antes de la preparación.
- RF5: cancelación del pedido.
- RF6: identificación del pedido para retiro.
- RF7: priorización manual.
- RF8: registro de pago.

### Funcionalidades excluidas
- integración con delivery externo,
- gestión avanzada de clientes,
- administración centralizada de múltiples locales,
- gestión de stock en tiempo real,
- análisis avanzado de ventas,
- sistema de fidelización o promociones complejas.

## 5. Problema de negocio
El negocio requiere un sistema que reduzca errores en atención, mejore la coordinación entre mostrador y cocina y permita controlar cada pedido desde su creación hasta su entrega. El problema real incluye:
- pedidos mal registrados,
- falta de visibilidad del estado,
- dificultades para modificar órdenes,
- demoras en la coordinación con cocina,
- errores en identificación al retiro,
- falta de trazabilidad en cancelaciones y pagos.

## 6. Requisitos funcionales
- RF1: tomar pedidos con personalizaciones y combos.
- RF2: enviar automáticamente la comanda a cocina.
- RF3: visualizar y seguir el estado del pedido.
- RF4: modificar un pedido mientras esté en estado Recibido.
- RF5: cancelar un pedido completo conservando el historial.
- RF6: identificar el pedido para retirar por número o nombre.
- RF7: priorizar manualmente pedidos urgentes.
- RF8: registrar el pago asociado al pedido.

## 7. Requisitos no funcionales
- RNF1: el sistema debe permitir incorporar nuevos locales en el futuro.
- RNF2: debe ser simple de operar y fácil de usar.
- RNF3: debe cumplirse con el plazo de entrega.
- RNF4: debe garantizar integridad y consistencia de los datos.
- RNF5: debe incluir seguridad y trazabilidad básica.

## 8. Actores del sistema
- Usuario de mostrador: registra, modifica, entrega y cobra pedidos.
- Cocina: recibe la comanda y actualiza el avance de preparación.
- Encargado: autoriza situaciones excepcionales, especialmente cancelaciones con criterios especiales.

## 9. Casos de uso principales
1. CU1 - Tomar Pedido
2. CU2 - Modificar Pedido
3. CU3 - Cambiar Estado del Pedido
4. CU4 - Cancelar Pedido
5. CU5 - Entregar Pedido

## 10. Regla de negocio central
El ciclo de vida del pedido debe seguir una secuencia válida:
- Recibido → En preparación → Listo → Entregado
- Recibido → Cancelado
- En preparación → Cancelado
- Listo → Cancelado con autorización del encargado
- Entregado → no modificable ni cancelable

## 11. Modelo de dominio
Las entidades principales del sistema son:
- Local
- Usuario
- Cliente
- Pedido
- ItemPedido
- Producto
- Combo
- Personalizacion
- Comanda
- Pago
- RegistroAuditoria
- EstadoPedido

## 12. Arquitectura sugerida
Se recomienda una arquitectura orientada a objetos con separación de responsabilidades:
- Capa de dominio: entidades y reglas del negocio.
- Capa de aplicación: lógica de casos de uso.
- Capa de infraestructura: persistencia y auditoría.
- Capa de presentación: interfaz para mostrador y cocina.

## 13. Clases principales
- Local: representa cada punto de venta.
- Usuario: opera el sistema.
- Pedido: encapsula el detalle del pedido y su estado.
- ItemPedido: combina producto, cantidad y personalizaciones.
- Producto: representa un artículo del menú.
- Combo: agrupa productos con un precio especial.
- Personalizacion: agrega modificaciones al producto.
- Comanda: documento interno enviado a cocina.
- Pago: registra el cobro asociado.
- RegistroAuditoria: deja evidencia de cambios relevantes.

## 14. Criterios de aceptación del MVP
Se considera aceptado cuando:
- el pedido se registra correctamente,
- la cocina recibe la comanda sin intervención manual,
- el estado se actualiza de forma consistente,
- el total es correcto,
- la cancelación y entrega quedan registradas,
- la identificación por número o referencia funciona,
- el pago queda asociado al pedido,
- la operación es clara y rápida para el usuario.

## 15. Plan de trabajo sugerido
1. Validar los casos de uso con el equipo.
2. Definir el diagrama de clases final.
3. Especificar las entidades y relaciones principales.
4. Documentar reglas de negocio y estados del pedido.
5. Preparar la propuesta técnica de implementación.
6. Definir stack tecnológico.
7. Formalizar la operación del mostrador y cocina.
8. Redactar la versión final para la entrega.

## 16. Integrantes del proyecto
| Integrante | Matrícula | Usuario de GitHub | Rol |
|---|---:|---|---|
| Lautaro Chumacero | 161959 | [@chumacerolautaro6-droid](https://github.com/chumacerolautaro6-droid) | Analista de requerimientos |
| Santiago Medel | 154076 | [@santimarM](https://github.com/santimarM) | Modelador de casos de uso |
| Sebastian Benitez |  | [@Sebas-Benitez](https://github.com/Sebas-Benitez) | Diseñador de clases iniciales |
| Fernando Molina | 153090 | [@fernandodanielm](https://github.com/fernandodanielm) | Coordinador/Documentador |

### Datos académicos
La matrícula, carrera y materia de cada integrante deben completarse con los datos oficiales de la comisión antes de la entrega final.

## 17. Diagramas y documentación relacionada
- [Anexos e introducción](anexos/introduccion.md)
- [Casos de uso](modelador%20de%20caso%20de%20uso/casos_de_uso.md)
- [Boceto inicial de clases](diagramas/01-diagrama-clases/01-boceto_inicial_clases.png)

## 18. Conclusión
El MVP propuesto para Sabor Kiosco responde a una necesidad concreta del negocio: mejorar la gestión de pedidos, reducir errores operativos y proporcionar una base sólida para la expansión futura del sistema. El enfoque del proyecto apunta a una solución simple, funcional, trazable y fácilmente adaptable a nuevos locales o nuevas funcionalidades.

## 19. Bibliografía y fuentes del proyecto
- Documentación de requerimientos del cliente.
- Evidencias operativas del negocio.
- Análisis orientado a objetos del problema.
- Boceto inicial de clases del sistema.
- Casos de uso identificados para la operación del local.

## 20. Observaciones finales
La propuesta presentada constituye una base válida para la etapa de análisis y diseño inicial del sistema. Su principal fortaleza radica en abordar los procesos esenciales del negocio con un nivel de complejidad adecuado para un MVP, priorizando funcionalidad, claridad operativa y posibilidad de evolución técnica posterior.