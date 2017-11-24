# ******************** kamila version 1.0.2 - Framework *********************
#
# Copyright (C) 2008 Edgar Gonzalez (egonzale.wordpress.com)
#
# This framework is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This framework is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this framework; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
# Este framework es software libre; puedes redistribuirlo y/o modificarlo
# bajo los terminos de la licencia publica general GNU tal y como fue publicada
# por la Fundacion del Software Libre; desde la version 2.1 o cualquier
# versi&oacute;n superior.
#
# Este framework es distribuido con la esperanza de ser util pero SIN NINGUN
# TIPO DE GARANTIA; sin dejar atras su LADO MERCANTIL o PARA FAVORECER ALGUN
# FIN EN PARTICULAR. Lee la licencia publica general para mas detalles.
#
# Debes recibir una copia de la Licencia Publica General GNU junto con este
# framework, si no es asi, escribe a Fundacion del Software Libre Inc.,
# 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
# ***************************************************************************
=begin
  super class: FPDF, descargarla desde: http://rubygems.org/search?utf8=%E2%9C%93&query=fpdf
               instalarla: gem install fpdf-1.53.gem --local
  class      : Mypdf
  Source     : mypdf.rb
  Autor      : Edgar Gonzalez
  Email      : edgargonzalezmunoz@gmail.com
  Framework  : kamila versión 1.0.2
  Fecha      : 18 de Julio del 2008

  This is based directly on the fifth tutorial example given on the
  FPDF website (http://www.fpdf.org).
=end
require 'rubygems'
require 'fpdf'

class Mypdf < FPDF
    private
    @font = nil
    @fontf = nil
    @image1 = nil
    @image2 = nil
    @xy1 = nil
    @xy2 = nil
    @xy3 = nil
    @xy4 = nil
    @title1 = nil
    @title2 = nil
    @title3 = nil
    @title4 = nil
    @lines = nil
    @y = nil
    @pagef = nil

    public
    #Encabezado de Pagina. Metodo agregado por Edgargonzalezmunoz@gmail.com
    def HeaderPage(font,image1,image2,xy1,title1,xy2,title2,xy3,title3,xy4,title4,lines)
     @font = font
     @image1 = image1
     @image2 = image2
     @xy1 = xy1
     @xy2 = xy2
     @xy3 = xy3
     @xy4 = xy4
     @title1 = title1
     @title2 = title2
     @title3 = title3
     @title4 = title4
     @lines = lines
    end

    def Header()
     #Font
     SetFont(@font[0].to_s,@font[1].to_s,@font[2])
     # Logos
     Image(@image1[0].to_s,@image1[1],@image1[2],@image1[3],@image1[4])
     Image(@image2[0].to_s,@image2[1],@image2[2],@image2[3],@image2[4])
     # titulos 4 lineas de encabezado
     SetXY(@xy1[0],@xy1[1])
     Cell(@title1[0],@title1[1],@title1[2].to_s,@title1[3],@title1[4],@title1[5].to_s)
     SetXY(@xy2[0],@xy2[1])
     Cell(@title2[0],@title2[1],@title2[2].to_s,@title2[3],@title2[4],@title2[5].to_s)
     SetXY(@xy3[0],@xy3[1])
     Cell(@title3[0],@title3[1],@title3[2].to_s,@title3[3],@title3[4],@title3[5].to_s)
     SetXY(@xy4[0],@xy4[1])
     Cell(@title4[0],@title4[1],@title4[2].to_s,@title4[3],@title4[4],@title4[5].to_s)
     # Salto de lineas
     Ln(@lines)
    end

    # Pie de pagina. Metodo agregado por Edgargonzalezmunoz@gmail.com
    def FooterPage(font,y,page)
     @fontf = font
     @y = y
     @pagef = page
    end

    def Footer()
     # font
     SetFont(@fontf[0].to_s,@fontf[1].to_s,@fontf[2])
     # Posicion: a -y cms del final
     SetY(@y)
     # Numero de pagina
     nro = PageNo()
     Cell(@pagef[0],@pagef[1],@pagef[2].to_s+nro.to_s+'/{nb}',@pagef[3],@pagef[4],@pagef[5].to_s)
    end

    # Load data
    def LoadData(file)
     data = Array.new
     # Read file lines
     IO.foreach(file) {|line| data.push(line.chop.split(';'))}
     return data
    end

    # Simple table
    def BasicTable(header, data)
     # Header
     header.each do |col|
     Cell(40, 7, col, 1)
     end
     Ln()
     # Data
     data.each do |row| 
      row.each {|col| Cell(40, 6, col, 1)}
      Ln()
     end
    end

    # Better table
    def ImprovedTable(header, data, wh, wd)
     # Column widths
     j=0
     0.upto(header.length - 1) do |i|
      Cell(wh[i,j], wh[i,j+1], header[i], wh[i,j+2], wh[i,j+3], wh[i,j+4].to_s)
     end
     Ln()
     # Data
     i=0
     k=0
     longitud = data.length
     data.each do |row| 
      row.each do |col| 
       #col.to_s.reverse.gsub(/\d{3}(?=\d)/, '\&,').reverse
       Cell(wd[i,j], wd[i,j+1], col.to_s, wd[i,j+2].to_s, wd[i,j+3], wd[i,j+4].to_s)
       i=i+1
      end
      if k!=longitud
       Ln()
      end
      k=k+1
     end
     # Closure line
     sum = 0
     for i in 0..header.length-1
      sum += wh[i,0]
     end
     Cell(sum, 0, '', 'T')
    end

    # Colored table
    def FancyTable(header, data, wh, wd, fillcolor, textcolor, drawcolor, linewidth, font, fillcolorRestart, textcolorRestart, fontRestart)
     # Colors, line width and bold font
     SetFillColor(fillcolor[0], fillcolor[1], fillcolor[2])
     SetTextColor(textcolor)
     SetDrawColor(drawcolor[0], drawcolor[1], drawcolor[2])
     SetLineWidth(linewidth)
     SetFont(font[0].to_s,font[1].to_s,font[2])
     # Column widths
     j=0
     0.upto(header.length - 1) do |i|
      Cell(wh[i,j], wh[i,j+1], header[i], wh[i,j+2], wh[i,j+3], wh[i,j+4].to_s,1)
     end
     Ln()
     # Color and font restoration
     SetFillColor(fillcolorRestart[0], fillcolorRestart[1], fillcolorRestart[2])
     SetTextColor(textcolorRestart)
     SetFont(fontRestart[0].to_s,fontRestart[1].to_s,fontRestart[2])
     # Data
     fill = 0 
     # Data
     i=0
     k=0
     longitud = data.length
     data.each do |row| 
      row.each do |col| 
       Cell(wd[i,j], wd[i,j+1], col.to_s, wd[i,j+2].to_s, wd[i,j+3], wd[i,j+4].to_s,fill)
       i=i+1
      end
      if k!=longitud
       Ln()
      end
      k=k+1
      fill = (fill == 0 ? 1 : 0)
     end
     # Closure line
     sum = 0
     for i in 0..header.length-1
      sum += wh[i,0]
     end
     Cell(sum, 0, '', 'T')
    end
end