require 'spec_helper'

describe SessionController do

  describe "GET 'signin'" do
    it "returns http success" do
      get 'signin'
      response.should be_success
    end
  end

end
