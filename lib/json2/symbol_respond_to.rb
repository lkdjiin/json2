module SymbolRespondTo

  def ~@
    ->(object) { object.respond_to?(self) }
  end

end

Symbol.send(:include, SymbolRespondTo)



