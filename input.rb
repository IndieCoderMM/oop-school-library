class Input
  def self.get(prompt, options: [], min_length: 1, type: 'str')
    valid = false
    input = nil
    until valid
      print prompt, ' >> '
      input = gets.chomp.strip
      next unless Input.valid?(input, min_length, type)

      unless type == 'date'
        input = input.to_i.zero? ? input : input.to_i
      end
      if !options.empty? && !options.include?(input)
        puts '[!] Invalid Input', "\t::options::#{options}"
        next
      end

      valid = true
    end
    input
  end

  def self.valid?(input, min_length, type)
    if input.length < min_length
      puts '[!] Please enter a value'
      return false
    end
    if type == 'num' && input.to_i <= 0
      puts '[!] Please enter a valid number'
      return false
    end
    if type == 'date'
      date_format = /\d{4}-\d{1,2}-\d{1,2}/
      unless input.match(date_format)
        puts '[!] Date must be in %Y-%m-%d format'
        return false
      end
    end
    true
  end
end
