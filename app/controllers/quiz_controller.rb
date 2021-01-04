require_relative '../helpers/application_helper'
require 'set'

class QuizController < ApplicationController

  include ApplicationHelper

  @@taker_set = Set.new

  def load_data
    @quiz = Quiz.find(1)
    @questions = Question.where(quiz_id: @quiz.id).to_a
    if params["attempt"]
        @attempt = Attempt.new(attempt_params)
    else
        @attempt = Attempt.new
        @attempt.phase = "begin"
    end
    @number_of_players = @@taker_set.size
  end

  def index
    load_data
  end

  def games
    load_data
  end

  def playgame
    t = Time.now.utc
    load_data
    str_time = t.strftime("%Y-%m-%dT%H:%M:%S.%N")
    message_text = "{\"quiz_id\"=>\"0\", \"question\"=>-1, \"taker\"=>\"#{@attempt.taker}\", \"submittedat\"=>\"#{str_time}\"}"
    publish_message(message_text)
    @attempt.phase = "done"
    render :template => "quiz/menu"
  end

  def menu
    load_data
  end

  def clear
    @@taker_set = Set.new
  end

  def start
    load_data
    @question_number = 0
    @attempt.quiz_id = @quiz.id
    @attempt.number_correct = 0
    @attempt.number_incorrect = 0
    @attempt.current_question_number = 1
    puts "The quiz taker is #{@attempt.taker}"
    if @attempt.taker.nil?
        @message = "You must provide a name."
        @attempt.phase = "begin"
    elsif @attempt.taker.length == 0
        @message = "You must provide a name."
        @attempt.phase = "begin"
    elsif @@taker_set.include? @attempt.taker
        @message = "Unforunately, the name #{@attempt.taker} is already taken. Please choose a different name."
        @attempt.phase = "begin"
    else
        @@taker_set.add @attempt.taker
        t = Time.now.utc
        str_time = t.strftime("%Y%m%d%H%M%S.%N")
        message_text = "{\"quiz_id\"=>\"#{@quiz.id}\", \"question\"=>0, \"taker\"=>\"#{@attempt.taker}\", \"answer\"=>\"none\", \"submittedat\"=>\"#{str_time}\", \"history\"=>\"\"}"
        publish_message(message_text)
        @attempt.phase = "name"
    end
    render :template => "quiz/index"
  end

  def attempt_params
    params.require(:attempt).permit(:taker, :quiz_id, :answer, :phase, :current_question_number)
  end

  def restart
    puts "In controller restart"
    load_data
    render :template => "quiz/menu"
  end

  def answer
    puts "In controller answer"
    load_data

    t = Time.now.utc
    str_time = t.strftime("%Y%m%d%H%M%S.%N")
    message_text = "{\"quiz_id\"=>\"#{@quiz.id}\", \"question\"=>#{@attempt.current_question_number.to_i}, \"taker\"=>\"#{@attempt.taker}\", \"answer\"=>\"#{@attempt.answer}\", \"submittedat\"=>\"#{str_time}\"}"
    publish_message(message_text)
    @message = "On question #{@attempt.current_question_number.to_i}, you answerered #{@attempt.answer}."

    @attempt.current_question_number = @attempt.current_question_number.to_i + 1
    render :template => "quiz/index"
  end
end
