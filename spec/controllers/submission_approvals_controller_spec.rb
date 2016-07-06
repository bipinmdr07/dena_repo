require 'rails_helper'

RSpec.describe SubmissionApprovalsController, type: :controller do
  describe "POST #create" do
    context "user is an admin" do
      it "should change the submission to approved" do
      end
    end

    context "user is not an admin" do
      it "should not change the submission to approved" do
      end
    end
  end
end
