class BadgeRewardService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
    @badges = []
  end

  def call
    Badge.all.each do |badge|
      case badge.rule
      when 'by_level'
        decision = if @user.has_badge?(badge)
                     false
                   else
                     by_level?(badge.rule_value)
                   end
      when 'first'
        decision = first?
      when 'by_category'
        decision = if @user.has_badge?(badge)
                     false
                   else
                     by_category?(badge.rule_value)
                   end
      end
      @badges.push(badge) if decision
    end
    @badges
  end

  def first?
    @test_passage.success? && TestPassage.where(user: @user, test: @test).count == 1
  end

  def by_category?(category)
    category_object = Category.where(title: category)
    Test.where(category: category_object).count == success_by_category(category_object)
  end

  def by_level?(level)
    Test.where(level: level).count == successful_by_level(level)
  end

  def successful_by_level(level)
    successful_pass = 0

    @user.tests.where(level: level).uniq.each do |test_by_level|
      test_by_level.test_passages.each do |test_passage|
        successful_pass += 1 if test_passage.success?
      end
    end
    successful_pass
  end

  def success_by_category(category_object)
    successful_pass = 0
    @user.tests.where(category: category_object).uniq.each do |test_by_category|
      test_by_category.test_passages.each do |test_passage|
        successful_pass += 1 if test_passage.success?
      end
    end
    successful_pass
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
