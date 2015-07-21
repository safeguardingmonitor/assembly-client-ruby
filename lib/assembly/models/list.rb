module Assembly
  class List < Model
    def each(&blk)
      self.data.each(&blk)
    end
  end
end