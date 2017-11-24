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
var ventana = null;
var boton1 = null;
var boton2 = null;
var boton3 = null;

//Definicion del Modelo
 Ext.define('Usuarios', {
    extend: 'Ext.data.Model',
    fields: [ 'nombre', 'apellido', 'profesion', 'institucion' ]
});

//Definicion del Data Store
var usuarioStore = Ext.create('Ext.data.Store', {
    model: 'Usuarios',
    data: [
         { nombre: 'Edgar', apellido: 'Gonzalez', profesion: 'Ing. Informática',institucion:'UCLA' },
        { nombre: 'Ramon', apellido: 'Valera', profesion: 'Ing. Informática',institucion:'UCLA'  },
        { nombre: 'Erika', apellido: 'Almeida', profesion: 'Ing. Informática',institucion:'UCLA' },
        { nombre: 'Jose' , apellido: 'Liscano', profesion: 'Ing. Informática',institucion:'UCLA'  },
        { nombre: 'Jalid', apellido: 'Chaer', profesion: 'Ing. Informática',institucion:'UCLA' },
        { nombre: 'Jesus', apellido: 'Kahwati', profesion: 'Ing. Informática',institucion:'UCLA'  }
    ]
});

//Definicion de la clase UsuariosGrid
Ext.define('App.UsuariosGrid', {
    extend: 'Ext.grid.Panel',
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.usuariosgrid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "Nombre", width: 120, dataIndex: 'nombre', sortable: true},
            {text: "Apellido", width: 120, dataIndex: 'apellido', sortable: true},
            {text: "Profesion", width: 100, dataIndex: 'profesion', sortable: true},
            {text: "Institución", width: 100, dataIndex: 'institucion', sortable: true}

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
                        var nombre = data.nombre;
                        var apellido = data.apellido;
                        var profesion = data.profesion;
                        var institucion = data.institucion
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
                    width: 70,
                    heigth: 50,
                    listeners: {
                      click : function() {
                       ventana.close();
                      }
                    }
                }     
    ]
  } ];
        // Origen de los datos, de un data store
        this.store = usuarioStore;
        this.forceFit = true;
        this.scroll = false;
        this.viewConfig = { style: {overflow: 'auto', overflowX: 'hidden' } };
        //this.verticalScroller = {xtype: 'paginggridscroller'};
        this.listeners = {
                          itemclick : function() {
                           data = this.getSelectionModel().selected.items[0].data;
                           alert(data.usuario);
                          }
                         };
        //Llamamos a la super clase a iniciacion del componente
        App.UsuariosGrid.superclass.initComponent.call(this);
    }
});

//Definicion de la ventana contendora del grid
Ext.define('miVentana', {
    extend: 'Ext.window.Window',

                layout: 'fit',
                x: 100,
                y: 100,
                width       : 385,
                height      : 200,
                closeAction :'hide',
                plain       : true,
                closable    : true,
                colapsable  : true,
                resizable   : true,
                maximizable : true,
                minimizable : true,
                modal       : true,
                title       : 'Catalogo de Usuarios',
                buttonAlign : 'center',
                constrain   : true,
                items:[
                 { xtype:'usuariosgrid' }
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
 ventana = Ext.create('miVentana');
 //Definimos un boton para luego mostrar la ventana
 boton1 = Ext.create('Ext.Button',
             { 
              text: 'Catalogo',
              renderTo: document.getElementById('boton1'),
              handler : function()
                {
                  ventana.show();
                }
             });
});

Ext.onReady(function() {
 ventana = Ext.create('miVentana');
 //Definimos un boton para luego mostrar la ventana
 boton2 = Ext.create('Ext.Button',
             { 
              text: 'Catalogo',
              renderTo: document.getElementById('boton2'),
              handler : function()
                {
                  ventana.show();
                }
             });
});

Ext.onReady(function() {
 ventana = Ext.create('miVentana');
 //Definimos un boton para luego mostrar la ventana
 boton3 = Ext.create('Ext.Button',
             { 
              text: 'Catalogo',
              renderTo: document.getElementById('boton3'),
              handler : function()
                {
                  ventana.show();
                }
             });
});