class Member::RelationshipsController < ApplicationController
  before_action :authenticate_member!, only: [:create, :destroy]
  
  def create
    current_member.follow(params[:member_id])
    flash[:notice] = "フォローしました。"
    redirect_to request.referer
  end
  
  def destroy
    current_member.unfollow(params[:id])
    flash[:notice] = "フォローを解除しました。"
    redirect_to request.referer
  end
  
  def followings
    @genres = Genre.where(is_active: true)
    @member = Member.find(params[:member_id])
    @members = @member.followings.page(params[:page]).per(10)
  end

  def followers
    @genres = Genre.where(is_active: true)
    @member = Member.find(params[:member_id])
    @members = @member.followers.page(params[:page]).per(10)
  end
end
