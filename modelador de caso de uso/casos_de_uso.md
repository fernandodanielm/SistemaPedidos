## Casos de uso

**Actores del sistema:**
- **Usuario de mostrador**: persona que atiende en el local (no hay roles fijos de mozo/cajero; cualquiera puede tomar pedidos, cobrar o entregar).
- **Cocina**: sector del negocio que recibe el pedido y actualiza su avance de preparación.
- **Encargado**: interviene en decisiones manuales excepcionales (ej. autorizar cancelaciones fuera de la regla general).

> Nota: *Cliente* no se modela como actor porque no interactúa directamente con el sistema en este MVP (los pedidos se toman por mostrador, no por WhatsApp).

---

### CU1 – Tomar Pedido

**Actor(es):** Usuario de mostrador

**Descripción breve:** El usuario de mostrador registra un nuevo pedido, agregando uno o más productos (con sus personalizaciones y cantidades), y el sistema lo envía automáticamente a cocina.

**Flujo principal de eventos:**
1. El usuario de mostrador inicia un nuevo pedido en el sistema.
2. El sistema genera un número de pedido y solicita un nombre o referencia de retiro.
3. El usuario agrega uno o más ítems (producto o combo), indicando cantidad y personalizaciones (ej. "sin cebolla", "extra queso").
4. El sistema calcula el precio de cada ítem (incluyendo el efecto de las personalizaciones) y el total del pedido.
5. El usuario confirma el pedido.
6. El sistema fija el pedido en estado "Recibido" y lo envía automáticamente a Cocina.

**Precondiciones:**
- El local está dentro del horario de atención (martes a domingo, 12–15 y 20–00hs).
- El usuario de mostrador está autenticado/operando el sistema.

**Postcondiciones:**
- El pedido queda registrado con un número único, ítems, total y estado "Recibido".
- Cocina recibe el pedido sin intervención manual adicional.

---

### CU2 – Modificar Pedido

**Actor(es):** Usuario de mostrador

**Descripción breve:** El usuario de mostrador corrige un pedido ya tomado (agregar, quitar o cambiar ítems/personalizaciones), siempre que cocina todavía no haya comenzado a prepararlo.

**Flujo principal de eventos:**
1. El usuario de mostrador selecciona un pedido existente para modificar.
2. El sistema valida que el pedido se encuentre en estado "Recibido".
3. El usuario agrega, elimina o modifica ítems y/o sus personalizaciones.
4. El sistema recalcula el total del pedido.
5. Si el pedido ya tenía un pago registrado, el sistema deja constancia de la diferencia a cobrar (sin gestionar pagos parciales).
6. El sistema conserva el mismo número de pedido (no se crea uno nuevo).

**Precondiciones:**
- El pedido existe y su estado actual es "Recibido".

**Postcondiciones:**
- El pedido queda actualizado con los nuevos ítems/personalizaciones y el total recalculado.
- Si corresponde, queda registrada una diferencia pendiente de cobro.
- Un pedido en estado "En preparación" o posterior rechaza cualquier intento de modificación.

---

### CU3 – Cambiar Estado del Pedido

**Actor(es):** Cocina

**Descripción breve:** Cocina informa el avance de un pedido (comenzó a prepararlo, lo terminó), y el sistema actualiza el estado respetando las transiciones válidas del ciclo de vida.

**Flujo principal de eventos:**
1. Cocina consulta los pedidos pendientes según su estado actual.
2. Cocina indica que comienza a preparar un pedido.
3. El sistema valida que la transición sea válida (Recibido → En preparación) y actualiza el estado.
4. Cocina indica que el pedido está terminado.
5. El sistema valida la transición (En preparación → Listo) y actualiza el estado.
6. El sistema bloquea cualquier modificación del pedido a partir de este punto.

**Precondiciones:**
- El pedido existe y tiene un estado que admite la transición solicitada (no se puede pasar, por ejemplo, de "Entregado" a "En preparación").

**Postcondiciones:**
- El pedido queda en un único estado actual, consistente y visible tanto para mostrador como para cocina (evitando el problema real detectado: un mismo pedido apareciendo en dos columnas de la pizarra).

---

### CU4 – Cancelar Pedido

**Actor(es):** Usuario de mostrador, Encargado

**Descripción breve:** El usuario de mostrador (o el encargado, en casos límite) cancela un pedido completo cuando el cliente se arrepiente o falta un producto, sin eliminar su registro histórico.

**Flujo principal de eventos:**
1. El usuario de mostrador selecciona el pedido a cancelar.
2. El sistema verifica el estado actual del pedido.
3. Si el pedido está en "Recibido" o "En preparación", el sistema permite la cancelación directamente.
4. Si el pedido está en "Listo", el sistema requiere la autorización del Encargado antes de cancelar.
5. El sistema cambia el estado del pedido a "Cancelado".
6. El sistema conserva el pedido y su historial (no lo elimina).

**Precondiciones:**
- El pedido no se encuentra ya en estado "Entregado" (un pedido entregado nunca puede cancelarse).

**Postcondiciones:**
- El pedido queda en estado "Cancelado", visible en el historial, sin volver nunca a un estado de preparación.

---

### CU5 – Entregar Pedido

**Actor(es):** Usuario de mostrador

**Descripción breve:** El usuario de mostrador identifica el pedido por su número o nombre de retiro y lo entrega al cliente, quedando registrado como finalizado.

**Flujo principal de eventos:**
1. El cliente se presenta en el mostrador y menciona su nombre de retiro o número de pedido.
2. El usuario de mostrador busca el pedido en el sistema por número o referencia.
3. El sistema muestra el pedido y confirma que su estado es "Listo".
4. El usuario de mostrador entrega el pedido físicamente al cliente.
5. El usuario confirma la entrega en el sistema.
6. El sistema cambia el estado del pedido a "Entregado".

**Precondiciones:**
- El pedido existe y su estado actual es "Listo".

**Postcondiciones:**
- El pedido queda en estado "Entregado" de forma definitiva (ya no admite cancelación ni modificación).

---

### Otros casos de uso identificados (no desarrollados en detalle en esta entrega)
- Registrar Pago
- Enviar a Cocina (automático, embebido en CU1)
- Consultar Pedidos Activos
- Marcar Prioridad
