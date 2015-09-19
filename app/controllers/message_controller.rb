class MessageController < ApplicationController
    
    before_action :authenticate_user!, only: [:write, :main]
    
    def main #나에게 받은 메시지/보낸메시지 출력
 
        
        @receive_message=Message.where(receiver: current_user.id)#내가 받은 메시지
        @send_message=Message.where(sender: current_user.id) #내가 보낸 메시지
    end
    
    def write #쪽지쓰기
    end
    
    def write_process #쪽지 보내기 프로세스
        if params[:receiver] =="모든학생"
          
          User.all.each do |u|
            new_message=Message.new
            new_message.sender=current_user.id #나중에 로그인한 사용자 이름으로 보내기로 변경할것
            new_message.receiver=u.id
            new_message.content=params[:content]
            new_message.save
          end
        else
          new_message=Message.new
          new_message.sender=current_user.id #나중에 로그인한 사용자 이름으로 보내기로 변경할것
          new_message.receiver=params[:receiver]
          new_message.content=params[:content]
          new_message.save
        end
          redirect_to :controller => 'book', :action => 'real_main', :alert_message => 'true'
        #   redirect_to :back , alert_message:"true"   
        # redirect_to controller:"book", action:"real_main", alert_message:true
        # redirect_to :back 
    end
    
    def read #쪽지 상세보기 페이지
        @message=Message.find(params[:id])
    end
    
    def reply # 답장보내는페이지
        @reply_message=Message.find(params[:id])
    end
    
    def send_message
        
        @receive_message=Message.where(receiver: current_user.id)#내가 받은 메시지
        @send_message=Message.where(sender: current_user.id) #내가 보낸 메시지
    
    end
    
    def receive_message
        
        @receive_message=Message.where(receiver: current_user.id)#내가 받은 메시지
        @send_message=Message.where(sender: current_user.id) #내가 보낸 메시지
    
    end
    
end
