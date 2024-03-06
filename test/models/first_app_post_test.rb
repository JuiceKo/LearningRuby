require "test_helper"

class FirstAppPostTest < ActiveSupport::TestCase
   test "draft? returns true for draft first app post" do
     assert first_app_posts(:draft).draft?
   end

   test "draft? returns false for published first app post" do
     refute first_app_posts(:published).draft?
   end

   test "draft? returns false for scheduled first app post" do
     refute FirstAppPost.new(published_at: 1.year.from_now).draft?
   end


   test "published? return true for published first app post"do
     assert FirstAppPost.new(published_at: 1.year.ago).published_at?
   end

   test "published? return false for draft first app post"do
     refute FirstAppPost.new(published_at: nil).published_at?
   end

   test "published? return false for scheduled first app post"do
     refute FirstAppPost.new(published_at: 1.year.from_now).published_at?
   end


   test "scheduled? return true for scheduled first app post"do
     assert FirstAppPost.new(published_at: 1.year.from_now).scheduled?
   end

   test "scheduled? return false for draft first app post"do
     refute draft_first_app_post.scheduled?
   end

   test "scheduled? return false for published first app post"do
     refute FirstAppPost.new(published_at: 1.year.ago).scheduled?
   end

   def draft_first_app_post
     FirstAppPost.new(published_at: nil)
   end
end
