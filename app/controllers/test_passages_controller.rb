class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  add_flash_types :link

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.success?
      flash[:notice] = t('.success', link: view_context.link_to(t('.link'), result.html_url))
      current_user.gists.create!(question: @test_passage.current_question,
                                  gist_hash: result.id)
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
