module PostsHelper

	def check_post_owner
		post = current_user.posts.where(:id => params[:id]).first
		if post.nil?
			flash[:error] = "That's not your post."
			redirect_to post_path(params[:id])
		end
	end
end
