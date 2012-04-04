require 'spec_helper'

describe EntriesController do


  context "logged in" do
    before(:each) do
      login_as_user!
    end

    it "should view index page" do
      get :index
      should respond_with(:success)
      should render_template('index')
    end

    it "should view entry page" do
      permalink = "a-random-#{Time.new.to_i}"
      entry = mock_model(Entry)
      Entry.should_receive(:find_by_slug!).with(permalink).and_return(entry)
      get :show, id: permalink
      should respond_with(:success)
      should render_template('show')
    end

    it "should reject a new entry" do
      get :new
      should redirect_to(root_path)
    end

    it "should reject draft query for non json query" do
      get :drafts
      should redirect_to(root_path)
    end

    it "should reject draft query for json query" do
      get :drafts, format: :json
      should redirect_to(root_path)
    end

    context "as admin" do
      before(:each) do
        login_as_admin!
      end

      it "should reject drafts for non json query" do
        get :drafts
        should respond_with(406)
      end

      it "should show drafts for json query" do
        get :drafts, format: :json
        should respond_with(:success)
      end

      it "redirect to new entry" do
        get :new
        should respond_with(302)
      end
    end
  end

  context "as guest" do

    it "should view index page" do
      get :index
      should respond_with(:success)
      should render_template('index')
    end

    it "should view entry page" do
      permalink = "a-random-#{Time.new.to_i}"
      entry = mock_model(Entry)
      Entry.should_receive(:find_by_slug!).with(permalink).and_return(entry)
      get :show, id: permalink
      should respond_with(:success)
      should render_template('show')
    end

    it "should redirect to root path while creating new entry" do
      get :new
      should redirect_to(root_path)
    end
  end

end
