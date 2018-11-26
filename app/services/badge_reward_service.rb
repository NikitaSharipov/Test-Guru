class BadgeRewardService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def call
    Badge.all.select do |badge|
    method_name = "#{badge.rule}?"
    send(method_name, badge)
    end
  end

  def first?(badge)
    @test_passage.success? && TestPassage.where(user: @user, test: @test).count == 1
  end

  def by_category?(badge)
    Test.by_category(badge.rule_value).count == success_by_category(badge)
  end

  def by_level?(badge)

    Test.where(level: badge.rule_value).count == successful_by_level(badge)
  end

  def successful_by_level(badge)
    elem = @user.test_passages.by_level(badge.rule_value).successful
    success_count(elem, badge)
  end

  def success_by_category(badge)
    elem = @user.test_passages.by_category(badge.rule_value).successful
    success_count(elem, badge)
  end

  def success_count(elem, badge)
    elem.group(:test).count.select { |k,v| v > @user.badges_count(badge)}.count
  end

end
