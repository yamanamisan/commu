class MembersController < ApplicationController
    before_action :login_required

  #メンバー一覧
  def index
     @members = Member.order("department")
      .page(params[:page]).per(15)
  end

  #会員の検索
  def search
    @members = Member.search(params[:q])
    .page(params[:page]).per(15)
    render "index"
  end

  #表示
  def show
    @member = Member.find(params[:id])
  end

  #新規作成
  def new
    @member = Member.new()
  end

  #更新
  def edit
    @member = Member.find(params[:id])
  end

  #新規登録
  def create
    @member = Member.new(member_params)
     if @member.save
      redirect_to @member, notice: "メンバーを登録しました。"
     else
      render "new"
   end
  end

  private def accounts_params
    params.require(:account).permit(
      :current_password,
      :password,
      :password_confirmation
    )
  end

 #編集
  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(member_params)
    if @member.save
      redirect_to @member, notice: "メンバー情報を更新しました。"
    else
      render "edit"
    end
  end

  #削除
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :members, notice: "会員を削除しました。"
  end

  private def member_params
    attrs = [
      :name,
      :email,
      :sex,
      :department,
      :administrator
    ]

    attrs << :password if params[:action] == "create"

    params.require(:member).permit(attrs)
  end
end
