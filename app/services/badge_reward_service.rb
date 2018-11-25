class BadgeRewardService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def call
    badges = []
    Badge.select do |badge|
      case badge.rule
      when 'by_level'
        by_level?(badge)
      when 'first'
        first?
      when 'by_category'
        by_category?(badge)
      end
    end
  end

  def first?
    @test_passage.success? && TestPassage.where(user: @user, test: @test).count == 1
  end

  def by_category?(badge)
    category_object = Category.where(title: badge.rule_value)
    (Test.where(category: category_object).count == success_by_category(category_object)) && @user.has_not_badge?(badge)
  end

  def by_level?(badge)
    (Test.where(level: badge.rule_value).count == successful_by_level(badge.rule_value)) && @user.has_not_badge?(badge)
  end

  def successful_by_level(level)
    @user.test_passages.by_level(level).where(success: true).count
  end

  def success_by_category(category_object)
    @user.test_passages.by_category(category_object).where(success: true).count
  end

end

 # def successful_by_level(level)
 #   successful_pass = 0
 #   @user.tests.where(level: level).each do |test_by_level|
 #     test_by_level.test_passages.each do |test_passage|
 #       successful_pass += 1 if test_passage.success?
 #     end
 #   end
 #   successful_pass
 # end
