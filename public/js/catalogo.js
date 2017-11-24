/*********************************************************/
/*                 ejemplo07.js                          */
/*********************************************************/
/*
  Autor  : Edgar Gonzalez
  Web    : http://egonzale.org
  Email  : egonzale@ucla.edu.ve
  Rails  : version 4.2.6
  Fecha  : 20 de mayo del 2016
*/
var data = null;
var ventana1 = null;
var bot = null;

//Definicion del Modelo
 Ext.define('Proyectos', {
    extend: 'Ext.data.Model',
    fields: [ 'titulo', 'responsable', 'estado' ]
});

//Definicion del Data Store
var proyectosStore = Ext.create('Ext.data.Store', {
    model: 'Proyectos',
    data: [
        { titulo: 'Redes', responsable: 'Jose Perez', estado: 'Asignación' },
        { titulo: 'Programacion', responsable: 'Rafael Rodriguez', estado: 'Asignación' },
        { titulo: 'POO', responsable: 'Edgar Gonzalez', estado: 'Asignación' },
        { titulo: 'Modelos de inventario', responsable: 'Jesus Kahwati', estado: 'Asignación' },
        { titulo: 'Probabilidad', responsable: 'Pedro Carreño', estado: 'Asignación' },
        { titulo: 'Modelos matemáticos', responsable: 'Jose Liscano', estado: 'Asignación' },
        { titulo: 'Estructura de datos', responsable: 'Erika Almeida', estado: 'Asignación' }
      
    ]
});

//Definicion de la clase UsuariosGrid
Ext.define('App.ProyectosGrid', {
    extend: 'Ext.grid.Panel',
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.proyectosgrid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "Titulo", width: 120, dataIndex: 'titulo', sortable: true},
            {text: "Responsable", flex: 1, dataIndex: 'responsable', sortable: true},
            {text: "Estado", width: 100, dataIndex: 'estado', sortable: true}
        ];
        this.dockedItems = [ {
    xtype: 'toolbar',
    dock: 'bottom',
    items: [
    
     { xtype: 'button',
                    text: 'Aceptar',
                    width: 70,
                    heigth: 50,
                    listeners: {
                      click : function() {
                       if (data!=null) {
                        var titulo = data.titulo;
                        var responsable = data.responsable;
                        var estado = data.estado;
                        Ext.MessageBox.show({
                         title: 'Mensaje',
                         msg: 'El Proyecto seleccionado es: ' + titulo + '<br>' + 'el responsable es: ' + responsable,
                         width:400,
                         buttons: Ext.MessageBox.OK
                        });
                       }
                       else {
                        alert("No ha seleccionado un item."); 
                       }
                      }
                    }
                },
                {
                    xtype: 'button',
                    text: 'Salir',
                    width: 70,
                    heigth: 50,
                    listeners: {
                      click : function() {
                       ventana1.close();
                      }
                    }
                }

                   
                

    ]
  } ];
        // Origen de los datos, de un data store
        this.store = proyectosStore;
        this.forceFit = true;
        this.scroll = false;
        this.viewConfig = { style: {overflow: 'auto', overflowX: 'hidden' } };
        //this.verticalScroller = {xtype: 'paginggridscroller'};
        this.listeners = {
                          itemclick : function() {
                           data1 = this.getSelectionModel().selected.items[0].data1;
                           alert(data1.usuario);
                          }
                         };
        //Llamamos a la super clase a iniciacion del componente
        App.ProyectosGrid.superclass.initComponent.call(this);
    }
});

//Definicion de la ventana contendora del grid
Ext.define('miVentana1', {
    extend: 'Ext.window.Window',

                layout: 'fit',
                x: 50,
                y: 50,
                width       : 385,
                height      : 500,
                closeAction :'hide',
                plain       : true,
                closable    : true,
                colapsable  : true,
                resizable   : true,
                maximizable : true,
                minimizable : true,
                modal       : false,
                title       : 'Catalogo de Proyectos',
                buttonAlign : 'center',
                constrain   : true,
                items:[
                 { xtype:'proyectosgrid' }
                 /*{
                    xtype: 'button',
                    text: 'Aceptar',
                    width: 50,
                    heigth: 50,
                    listeners: {
                      click : function() {
                       if (data!=null) {
                        var usuario = data.usuario;
                        var clave = data.clave;
                        var nivel = data.nivel;
                        Ext.MessageBox.show({
                         title: 'Mensaje',
                         msg: 'El usuario seleccionado es: ' + usuario + '<br>' + 'La clave seleccionada es: ' + clave + '<br>' + 'El nivel seleccionado es: ' + nivel,
                         width:400,
                         buttons: Ext.MessageBox.OK
                        });
                       }
                       else {
                        alert("No ha seleccionado un item."); 
                       }
                      }
                    }
                },
                {
                    xtype: 'button',
                    text: 'Salir',
                    width: 50,
                    heigth: 50,
                    listeners: {
                      click : function() {
                       ventana.close();
                      }
                    }
                }*/
                ]


            });
//Instanciamos la ventana
Ext.onReady(function() {
 ventana1 = Ext.create('miVentana1');
 //Definimos un boton para luego mostrar la ventana
 bot = Ext.create('Ext.Button',
             { 
              text: 'Catalogo de proyectos',
              renderTo: document.getElementById('bot'),
                handler : function()
            {
                  ventana1.show();
                }
             });
});