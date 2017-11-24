 /*********************************************************/
/*                 ejemplo12.js                          */
/*********************************************************/
/*
  Autor  : Edgar Gonzalez
  Web    : http://egonzale.org
  Email  : egonzale@ucla.edu.ve
  Rails  : version 4.2.6
  Fecha  : 20 de mayo del 2016
*/

Ext.onReady(function() {

	Ext.apply(Ext.form.VTypes, {
	    daterange : function(val, field) {
	        var date = field.parseDate(val);
	 
	        if(!date){ 
	            return;
	        }
	        if (field.startDateField && (!this.dateRangeMax || (date.getTime() != this.dateRangeMax.getTime()))) {
	            var start = Ext.getCmp(field.startDateField);
	            start.setMaxValue(date);
	            start.validate();
	            this.dateRangeMax = date;
	        }
	        else if (field.endDateField && (!this.dateRangeMin || (date.getTime() != this.dateRangeMin.getTime()))) {
	            var end = Ext.getCmp(field.endDateField);
	            end.setMinValue(date);
	            end.validate();
	            this.dateRangeMin = date;
	        }
	        /*
	         * Always return true since we're only using this vtype to set the
	         * min/max allowed values (these are tested for after the vtype test)
	         */
	        return true;
	    }
	});
	
	var dateStart =  new Ext.form.DateField({
	    allowBlank: false,
	    name: 'dataStart',
	    id: 'dataStart',
	    //fieldLabel: "Fecha de Inicio",
	    hideLabel: false,
	    vtype: 'daterange',//type here
	    endDateField: 'dateEnd'//and end date field
	});
	 
	var dateEnd =  new Ext.form.DateField({
	    allowBlank: false,
	    id: 'dateEnd',
	    name: 'dateEnd',
	    //fieldLabel: "Fecha Final",
	    hideLabel: false,
	    vtype: 'daterange',//add type
	    startDateField: 'dataStart'//start date field
	});
    dateStart.render("fechainicio");
    dateEnd.render("fechafinal");
});