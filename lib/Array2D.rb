# /****************************************************************************/
# /*                   clase Array2D                                          */
# /*                                                                          */
# /* Clase para Manejar Arreglos de 2 Dimensiones                             */
# /****************************************************************************/
# /*
#  Version: 1.0 en ruby 1.8.x
#  Fecha  : 28 de Marzo 2008
#  Autor  : by Greg Brown
#  http   : http://rubyquiz.com/quiz33.html
# */

class Array2D
 attr_reader :w, :h
 def initialize(w, h, defel=nil)
  @w, @h=w, h
  @array=Array.new(w*h, defel)
 end
 def [](x, y)
  @array[(y % h) * w + (x % w)]
 end
 def []=(x, y, v)
  @array[(y % h) * w + (x % w)]=v
 end
 def to_s
  (0...h).collect { |y|
   (0...w).collect { |x|
    v=self[x, y]
    block_given? ? yield(v) : v
   }.join " "
  }.join "\n"
 end
end