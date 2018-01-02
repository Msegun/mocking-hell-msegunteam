require 'rails_helper'

RSpec.feature "Article-show" do

  feature "#Showing an Article" do
    before do
      @john = User.create(email: "john@example.com", password: "password")
      @fred = User.create(email: "fred@example.com", password: "password")
      @article = Article.create(title: "The first article", body: "Lorem ipsum dolor sit amet, consectetur.", user: @john)
    end

    scenario "to a non-signed in user hide Edit/Delete Links" do
      visit "/"
      click_link @article.title
      expect(page).to have_content(@article.title)
      expect(page).to have_content(@article.body)
      expect(current_path).to eq(article_path(@article))
      expect(page).not_to have_link("Edit Article")
      expect(page).not_to have_link("Delete Article")
    end

    scenario "to a non-owner hide Edit/Delete Links" do
      login_as(@fred)
      visit "/"
      click_link @article.title
      
      expect(page).to have_content(@article.title)
      expect(page).to have_content(@article.body)
      expect(current_path).to eq(article_path(@article))
      expect(page).not_to have_link("Edit Article")
      expect(page).not_to have_link("Delete Article")
    end
  end
end
