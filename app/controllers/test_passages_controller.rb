class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed? || @test_passage.time_over?
      TestsMailer.completed_test(@test_passage).deliver_now
#Бэджи
      current_badges = BadgeRewardService.new(@test_passage).call

      if current_badges.present?
        current_user.badges.push(current_badges)
        names = current_badges.map(&:title).join(', ')
        flash[:notice] = t('.awards', names: names)
      end
#Бэджи конец
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.success?
      flash[:notice] = t('.success', link: view_context.link_to(t('.link'), result.html_url, target: "_blank"))
      current_user.gists.create!(question: @test_passage.current_question,
                                  gist_url: result.html_url)
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
