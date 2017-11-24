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
var data1 = null;
var ventana1 = null;
var btn = null;

//Definicion del Modelo
 Ext.define('Proyectos', {
    extend: 'Ext.data1.Model',
    fields: [ 'usuario', 'clave', 'nivel' ]
});

//Definicion del Data Store
var proyectosStore = Ext.create('Ext.data.Store', {
    model: 'Proyectos',
    data1: [
        { usuario: 'yiyi', clave: '123', nivel: '1' },
        { usuario: 'kamila', clave: '234', nivel: '2' },
        { usuario: 'paola', clave: '345', nivel: '2' },
        { usuario: 'edgar1', clave: '567', nivel: '2' },
	    { usuario: 'edgar2', clave: '567', nivel: '2' },
	    { usuario: 'edgar3', clave: '567', nivel: '2' },
	    { usuario: 'edgar4', clave: '567', nivel: '2' },
	    { usuario: 'edgar5', clave: '567', nivel: '2' }
    ]
});

//Definicion de la clase UsuariosGrid
Ext.define('App.proyectosGrid', {
    extend: 'Ext.grid.Panel',
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.proyectosgrid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "Usuario", width: 120, dataIndex: 'usuario', sortable: true},
            {text: "Clave", flex: 1, dataIndex: 'clave', sortable: true},
            {text: "Nivel", width: 100, dataIndex: 'nivel', sortable: true}
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
                       if (data1!=null) {
                        var usuario = data1.usuario;
                        var clave = data1.clave;
                        var nivel = data1.nivel;
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
 btn = Ext.create('Ext.Button',
             { 
             	text: 'Catalogo de Proyectos',
             	renderTo: document.getElementById('btn'),
              handler : function()
                {
                  ventana1.show();
                }
             });
});
