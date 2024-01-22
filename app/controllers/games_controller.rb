class GamesController < ApplicationController

  def new
    @letters = []
    10.times do
      random_letter = ('a'..'z').to_a.sample
      @letters << random_letter
    end
  end

  def score
    @word = params[:word]
    @letters_list = params[:letters].chars
    @response = ''
    @word.chars.each do |letter|
      if @letters_list.include?(letter)
        index_to_remove = @letters_list.index(letter)
        @letters_list.delete_at(index_to_remove)
        @response = "valid"
      else
        @response = 'invalid'
      end
    end

  end
end
