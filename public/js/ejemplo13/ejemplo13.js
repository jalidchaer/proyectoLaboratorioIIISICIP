
	Ext.require([
	         	'Ext.tree.*',
	         	'Ext.data.*',
	         	'Ext.tip.*'
	         ]);

	         Ext.onReady(function() {
	         	Ext.QuickTips.init();
	         	
	         	var store = Ext.create('Ext.data.TreeStore', {
	         		
	         		proxy: {
	         			type: 'ajax',
	         			method: 'GET',
	         			url: 'arbol/ajax?tipo='+rol//ojo aqui es donde le paso el parametro del tipo de rol esta logueando
	         		},
	         		root: {
	         			text: 'Menu',
	         			id: 'root_node',
	         			expanded: true
	         		},
	         		folderSort: false,
	         		sorters: [{
	         			property: 'id',
	         			direction: 'ASC'
	         		}]
	         	});

	         	var tree = Ext.create('Ext.tree.Panel', {
	         		scroll          : true,
  					viewConfig      : {
   					style           : { overflow: 'auto', overflowX: 'hidden' }
  					},
	         		store: store,
	         		renderTo: 'tree_el',
	         		height: 400,
	         		width: 380,
	         		title: 'Opciones',
	         		useArrows: true/*,
	                         listeners: {
	                         itemclick: function(view, node) {
	                         if(node.isLeaf()) {
	                          Ext.Msg.alert('Datos del Nodo',
	                             'Nodo id: ' + node.get('id') + '<br/>' +
	                             'Nodo Texto: ' + node.get('text') + '<br/>' +
	                             'Padre Nodo id: ' + node.get('parentId') + '<br/>' +
	                             'Es una hoja?: ' + node.get('leaf') + '<br/>' +
	                             'Nro de Hijos: ' + node.childNodes.length
	                         );
	                         } else if(node.isExpanded()) {
	                            node.collapse();
	                           } else {
	                              node.expand();
	                             }
	                        }
	         	       	
	                  }*/
	         	});
	         });