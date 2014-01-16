require 'spec_helper'

describe Entry do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @entry = Entry.new(title: "Entry title",body: "Entry body", user_id: user.id)
  end
  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @entry }

  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  it { should respond_to(:comments) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @entry.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank body" do
    before { @entry.body = " " }
    it { should_not be_valid }
  end

  describe "with body that is too long" do
    before { @entry.body = "a" * 1001 }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @entry.title = " " }
    it { should_not be_valid }
  end

  describe "with title that is too long" do
    before { @entry.title = "a" * 51 }
    it { should_not be_valid }
  end

  describe "comment associations" do

    before { @user.save }
    before { @entry.save }
    let!(:older_comment) do
      FactoryGirl.create(:comment, user: @user, entry: @entry, created_at: 1.day.ago)
    end
    let!(:newer_comment) do
      FactoryGirl.create(:comment, user: @user, entry: @entry, created_at: 1.hour.ago)
    end

    it "should have the right comments in the right order" do
      expect(@user.comments.to_a).to eq [newer_comment, older_comment]
    end

    it "should destroy associated comments" do
      comments = @entry.comments.to_a
      @entry.destroy
      expect(comments).not_to be_empty
      comments.each do |comment|
        expect(Comment.where(id: comment.id)).to be_empty
      end
    end
  end
end