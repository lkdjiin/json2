#  Simplify the use of duck typing in case/when structure.
#
# Examples
#
#   a = []
#   b = ~:each
#   b.call(a) #=> true
#
#   # How is this simplification!? Are you kiding me?
#   # We can use it like this:
#
#   case object
#   when ~:each then …
#   when ~:keys then …
#   else …
#   end
module SymbolRespondTo

  def ~@
    ->(object) { object.respond_to?(self) }
  end

end

Symbol.send(:include, SymbolRespondTo)
