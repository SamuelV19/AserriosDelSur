// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", function() {
    const transactionTypeSelect = document.getElementById("transaction_type_select");
  
    // Función para actualizar los campos según el tipo de transacción
    function updateFormFields() {
      const transactionType = transactionTypeSelect.value;
  
      // Mostrar/ocultar los campos según el tipo de transacción
      if (transactionType === 'purchase') {
        document.getElementById("buyer_or_supplier_div").style.display = 'block';  // Proveedor
        document.getElementById("client_or_customer_div").style.display = 'none';  // Cliente
        document.getElementById("extra_fields_for_purchase").style.display = 'block';  // Detalles de compra
        document.getElementById("extra_fields_for_sale").style.display = 'none';  // Detalles de venta
      } else if (transactionType === 'sale') {
        document.getElementById("buyer_or_supplier_div").style.display = 'none';  // Proveedor
        document.getElementById("client_or_customer_div").style.display = 'block';  // Cliente
        document.getElementById("extra_fields_for_purchase").style.display = 'none';  // Detalles de compra
        document.getElementById("extra_fields_for_sale").style.display = 'block';  // Detalles de venta
      }
    }
  
    // Llamar a la función cuando el documento esté listo
    updateFormFields();
  
    // Escuchar el cambio de tipo de transacción
    transactionTypeSelect.addEventListener("change", updateFormFields);
  });
  

  document.addEventListener('DOMContentLoaded', function() {
    // Obtén el select de inventario y la cantidad
    const inventorySelect = document.getElementById('inventory_select');
    const quantityField = document.getElementById('quantity_field');
    const priceField = document.getElementById('price_field');
    
    // Función que actualiza el precio basado en la cantidad seleccionada
    function updatePrice() {
      const inventoryId = inventorySelect.value;
      const quantity = quantityField.value;
      
      // Si hay inventario seleccionado y cantidad, realiza la multiplicación
      if (inventoryId && quantity) {
        // Hacer una petición para obtener el precio del inventario seleccionado
        fetch(`/inventories/${inventoryId}`)
          .then(response => response.json())
          .then(data => {
            const pricePerUnit = data.price;  // Asumiendo que 'price' es parte de los datos de la respuesta
            const totalPrice = pricePerUnit * quantity;
            priceField.value = totalPrice.toFixed(2);  // Redondear a dos decimales
          })
          .catch(error => console.error('Error al obtener el precio:', error));
      } else {
        priceField.value = '';  // Si no se selecciona inventario o cantidad, limpiar el campo
      }
    }
  
    // Agregar un evento para cuando se cambia el inventario o la cantidad
    inventorySelect.addEventListener('change', updatePrice);
    quantityField.addEventListener('input', updatePrice);  // Usar 'input' para detectar cuando cambia la cantidad
  });
  