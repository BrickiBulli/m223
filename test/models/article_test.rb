require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = Article.new(
      name: "Sample Article",
      article_number: "A123",
      weight: 10.5
    )
  end

  test "should be valid with valid attributes" do
    assert @article.valid?
  end

  test "should be invalid without a name" do
    @article.name = nil
    assert_not @article.valid?
  end

  test "should be invalid without an article_number" do
    @article.article_number = nil
    assert_not @article.valid?
  end

  test "should be invalid with a duplicate article_number" do
    duplicate_article = @article.dup
    @article.save
    assert_not duplicate_article.valid?
  end

  test "should be invalid with a non-numerical weight" do
    @article.weight = "not_a_number"
    assert_not @article.valid?
  end

  test "should be invalid with a weight less than or equal to zero" do
    @article.weight = 0
    assert_not @article.valid?
    @article.weight = -1
    assert_not @article.valid?
  end

  test "should calculate current stock correctly" do
    @article.save
  employee = Employee.create!(
    first_name: "John",
    last_name: "Doe",
    address: "123 Main St",
    city: "Anytown",
    postal_code: "12345",
    email: "john.doe@example.com",
    role: Employee::ROLE_STORAGE_MANAGER,
    password: "securepassword123"
  )
  @article.inventory_entries.create!(quantity: 100, employee: employee, entry_date: Date.today)
  @article.inventory_exits.create!(quantity: 30, employee: employee, exit_date: Date.today)
  assert_equal 70, @article.current_stock
  end
end
