class FirstAppPosts::CoverImagesController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :authenticate_user!
  before_action :set_first_app_post

  def destroy
    @first_app_post.cover_image.purge_later
    respond_to do |format|
      format.html { redirect_to edit_first_app_post_path(@first_app_post)}
      format.turbo_stream {render turbo_stream: turbo_stream.remove(dom_id(@first_app_post, :cover_image))}
    end
  end


  def set_first_app_post
    @first_app_post =  FirstAppPost.find(params[:first_app_post_id])
  end
end
