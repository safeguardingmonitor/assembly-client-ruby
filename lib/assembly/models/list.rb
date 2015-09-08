module Assembly
  class List < Model
    def each(&blk)
      self.data.each(&blk)
    end

    def next
      self
    end
  end
end