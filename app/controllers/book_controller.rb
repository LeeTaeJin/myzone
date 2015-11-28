class BookController < ApplicationController
    
     before_action :authenticate_user!, only: [:booking, :view_booking,:real_main,:main,:booking_process,:mypage,:delete, :update_state,:tip,:searching]
    
    def upload_subject
      @subject=Subject.new
      @subject.room_id=params[:room_id]
      @subject.subject_name=params[:subject]
      @subject.subject_time=params[:subject_time]
      @subject.day=params[:day]
      @subject.save
      
      redirect_to :back
    end
    
    def real_main  # 메인페이지
       
  
      
     
    end
    
    
    def main 
        @building=Building.all
        
    end
    
    def detail_info
        #건물별 강의실 정보 출력
        @building=Building.find(params[:id])
        @class_list=Room.where(building_name: @building.name)
        
    end
    
    def view_booking
        #해당 강의실의 예약현황을 보여줌
        @class=Room.find(params[:id])
        @date=params[:date]
        
        
    end
    
    def booking #신청서 작성
        @class=Room.find(params[:id])
        @date=params[:date]
        
        @save_result = params[:save_result]
        @user_department=User.find(current_user.id).department
        
        case @user_department 
        when "신학과"
          @professor=["한동구","유윤종","조상열","김동수","신현수","안명준","김문기","이광희","류원렬","양유성","권평","김현진", "윤천석","조덕영","김희진"]
        when "국어국문학과"
          @professor=["조일규","김대숙","이덕화","김용희"]
        when "도시및부동산개발학과"
          @professor=["장정민","민창기","윤혜정","이시화"]
        when "행정학과"
          @professor=["박승용","진세혁","강휘원","사공영호"]
        when "사회복지학과"
          @professor=["이혜경","신은주","신승연","최현미","손병돈","최승희","한정우","이상무","박지현"] 
        when "아동청소년복지학과"
          @professor=["정하성","이장현","유진이","이민희","조민자","김정희"]
        when "재활복지학과"
          @professor=["정하성","이장현","유진이","이민희","조민자","김정희"]
        when "경영학과"
          @professor=["변용범","하정복","김승욱","최완수","백상미"]
        when "무역/물류학과"
          @professor=["조현수","백종실","김기홍","이동현"]
        when "광고홍보학과"
          @professor=["염성원","오현숙","이치형","양정은","최문규"]
        when "미국학과"
          @professor=["황영순","김남균","손세호","박진임","니콜"]
        when "중국학과"
          @professor=["지세화","박기철","오일환","박종우","곽상"]
        when "일본학과"
          @professor=["김은숙","구견서","선재원","모치다유미꼬"]
        when "컴퓨터학과"
          @professor=["문원식","윤석규","김동철","양단희","조영희","장희선"]
        when "정보통신학과"
          @professor=["이경희","문필주","변진욱","이갑래"]
        when "데이터정보학과"
          @professor=["정혜정","이훈자","곽민정","박종태"]
        when "음악학과"
          @professor=["이루사","임옥란","김형기","정영안","김세은"]
        when "실용음악학과"
          @professor=["오은영","유성은","이태윤","이현욱"]
        when "방송연예학과"
          @professor=["이윤선","서나영","김진욱","김성진","이한위"]
        when "시각디자인학과"
          @professor=["최종란","조현승","신성철","박인성"]
        when "영상디자인학과"
          @professor=["이영헌","김경수","김혜성","김미숙"]
        when "패션디자인및브랜딩학과"
          @professor=["박혜숙","구본영","이재영","손우진","박성주"]
        when "간호학과"
          @professor=["이미라","남현아","정은숙","박현정"]
        when "환경융합시스템학과"
          @professor=["윤영훈","조영일","이철민","김호현","김중구"]
        else # the else optional
          @professor=["없음(교수본인 or 외부 이용자)","교양교수님(필히 사용목적에 교양교수님 성함을 적어주세요.)"]  
        end
        
        #신청양식
    end
    

    
    def booking_process #중복
    
        @date=params[:date].to_time
        @all_reservation=Reservation.where(room_id: params[:id]).where(date: params[:date])  #날짜와 강의실 정보를 가져 온다
        @start_time=Time.new(@date.year, @date.month, @date.day, params[:start_time].to_time.hour, params[:start_time].to_time.min) # 에약 시작시간 저장
        @finish_time=Time.new(@date.year, @date.month, @date.day, params[:finish_time].to_time.hour, params[:finish_time].to_time.min) # 예약 마침시간 저장
      
         
        if (( Time.zone.now<= @start_time.to_s(:db)) and (@start_time.to_s(:db) < @finish_time.to_s(:db))) # 현재시간 이후 && 예약시작시간이 마침시간보다 이전 일 때
          
          if @all_reservation.count==0 #예약된게 없는 경우 에약 가능함
            if (Time.zone.today + 2.weeks).to_date < @start_time.to_date  # 오늘 날짜 이후 2주 뒤 날짜라면 
              
                  #예약이 안되게함.
               @save_result = "false_over_2week"  
                  
            else #2주 뒤가 아닐때,
              @save_result="true" #예약이 가능하도록 한다.
            end
            
          else  #예약이 하나라도 있는 경우 
            @all_reservation.each do |r| #전체 예약을 뽑아온다
                  if ((@start_time.between?(r.start_time, r.finish_time)) or    # 새로입력하는 예약시간이 기존에 있는 시간 사이에 있거나,
                      (@finish_time.between?(r.start_time, r.finish_time)) or    # 밖에 있는경우 예약불가
                      ((@start_time <= r.start_time) and (r.finish_time <= @finish_time))) # ??
                    
                    # 기존에 있던 예약과 중복이 된다면 예약불가 
                    
                    @save_result = "false_overlap"  
                    
                  else #예약이 중복되지 않고
                    
                              # 2주 뒤인지 확인해서,
                              if (Time.zone.today + 2.weeks).to_date < @start_time.to_date
                                
                                    #2주 뒤인 경우 예약이 안되게함.
                                    @save_result = "false_over_2week"
                                    
                              else #2주 뒤가 아닐때,
                              
                             #저장 ok  
                              @save_result = "true"
                              end    
                  end 
            end #all_reservation.each do  

            
                    
          end #@all_reservation.count==0
         
        else
            @save_result = "false_not_later"
          
        end #현재시간보다 나중이어야하고 시작시간이 현재시간보다 전이어야함 if
        
        #걸러줌!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
        
        
        if @save_result == "true" 
          
            @reservation=Reservation.new
            @reservation.building=params[:building_name]
            @reservation.department=current_user.department
            @reservation.room_id=params[:id]
            @reservation.user=current_user.id 
            @reservation.professor=params[:professor]
            @reservation.date=params[:date]
            @reservation.start_time=@start_time
            @reservation.finish_time=@finish_time
            @reservation.purpose=params[:purpose]
            @reservation.accept_people=params[:people_scale]
            @reservation.state="승인대기"
            @reservation.save
            
            redirect_to action:"view_booking", id: params[:id], date: params[:date]
            
        # elsif @all_reservation.nil?
        #   @reservation=Reservation.new #새로운 예약 db를 생성
        #   @reservation.room_id=params[:id]
        #   @reservation.user=current_user.email #여기다가는 유저 이름을 저장한다.(나중에 수정할것)
        #   @reservation.professor=params[:professor]
        #   @reservation.date=params[:date]
        #   @reservation.start_time=@start_time
        #   @reservation.finish_time=@finish_time
        #   @reservation.purpose=params[:purpose]
        #   @reservation.save
          
        #   redirect_to action:"view_booking", id: params[:id], show_date: params[:date]
          
        elsif @save_result =="false_overlap"
          redirect_to action:"booking", id: params[:id], date: params[:date], save_result: "false_overlap"
        elsif @save_result=="false_over_2week"
          redirect_to action:"booking", id: params[:id], date: params[:date], save_result: "false_over_2week"
        elsif @save_result=="false_not_later"
          redirect_to action:"booking", id: params[:id], date: params[:date], save_result: "false_not_later"
        end
        
            
    end
    
    def mypage
       
      # @message = Message.all
    end
    
    def delete #예약 지울때
        reservation_del = Reservation.find(params[:id])
        reservation_del.destroy
        
        redirect_to :back
    end
    
   
   def update_state
       
       update_state=Reservation.find(params[:reservation_num])
       update_state.state=params[:state]
       update_state.save
       #
      # reject_reason = Message.new
      # reject_reason.sender=params[:sender]
      # reject_reason.receiver=params[:receiver]
      # reject_reason.content = params[:content]
      # reject_reason.save
       
       render:text =>" "
   end
   
   def update_state_reject
       update_state=Reservation.find(params[:reservation_num])
       update_state.state=params[:state]
       update_state.save
       #
       reject_reason = Message.new
       reject_reason.sender=params[:reservation_num] #예약 넘버
       reject_reason.receiver=params[:receiver]
       reject_reason.content = params[:content]
       reject_reason.save
       
       redirect_to :back
   end
    
    
    def tip
        
    end
    
    def admin_menu
      
    end
    
    def admin_menu_delete #admin_menu에서 불편사항, 개선사항 삭제
                   
            am_delete = Message.find(params[:id])
         
            am_delete.destroy  
            
            redirect_to :back
      
    end
    
    def searching #조건검색
      @searching_scale=params[:searching_scale]
      @searching_building=params[:searching_building]
      
    end
    
    def upload_alert
      
      @new_alert=Sidealert.new
      @new_alert.color=params[:alert_color]
      @new_alert.content=params[:alert_content]
      @new_alert.save
      
      redirect_to '/book/admin_menu'
      
    end
    
    def delete_alert
      delete_alert = Sidealert.find(params[:id])
      delete_alert.destroy
      
      redirect_to :back
    end
    
    def reser_admin
      @reservation_time = params[:reservation_time]
      @reservation_date = params[:reservation_date]
      @reservation_building = params[:reservation_building]
      @reservation_department=params[:reservation_department]
      
      
    end
    
    def offline
      
    end
    
    
end
                
        
        # if (Time.zone.now<= Time.new(@date.year, @date.month, @date.day, @start_time.hour, @start_time.min) and (@start_time < @finish_time)) 
            
        #     if (@all_reservation.where('start_time AND finish_time BETWEEN ? AND ?', Time.new(@date.year, @date.month, @date.day, @start_time.hour, @start_time.min), Time.new(@date.year, @date.month, @date.day, @finish_time.hour, @finish_time.min)) or @all_reservation.where('start_time BETWEEN ? AND ?', Time.new(@date.year, @date.month, @date.day, @start_time.hour, @start_time.min), Time.new(@date.year, @date.month, @date.day, @finish_time.hour, @finish_time.min)) or @all_reservation.where('finish_time BETWEEN ? AND ?', Time.new(@date.year, @date.month, @date.day, @start_time.hour, @start_time.min), Time.new(@date.year, @date.month, @date.day, @finish_time.hour, @finish_time.min)))
        #         redirect_to '/'
                
                
            # if (r.start_time..r.finish_time).include?(@reservation.start_time) or (r.start_time..r.finish_time).include?(@reservation.finish_time)
            # if @all_reservation.where('start_time AND finish_time BETWEEN ? AND ?', Time.new(@date.year, @date.month, @date.day, @start_time.hour, @start_time.min), Time.new(@date.year, @date.month, @date.day, @finish_time.hour, @finish_time.min)) or @all_reservation.where('start_time BETWEEN ? AND ?', @reservation.start_time, @reservation.finish_time) or @all_reservation.where('finish_time BETWEEN ? AND ?', @reservation.start_time, @reservation.finish_time).sds
            
                    # or (r.start_time..r.finish_time).between?(@reservation.start_time..@reservation.finish_time)
                #if (Time.new(@start_time.hour, @start_time.min)).overlaps?(Time.new(r.start_time.hour, r.start_time.min)..Time(r.finish_time.hour, r.finish_time.min)) or (@reservation.finish_time.to_time).overlaps?(r.start_time.to_time..r.finish_time.to_time) 
                #if (r.start_time..r.finish_time).overlaps?(@reservation.start_time..@reservation.finish_time)   #시간이 중복되면?
                #     #if((@reservation.start_time..@reservation.finish_time).cover?(r.start_time) or (@reservation.start_time..@reservation.finish_time).cover?(r.finish_time)
#             else 
                
#                 @reservation=Reservation.new #새로운 예약 db를 생성
#                 @reservation.room_id=params[:id]
#                 @reservation.user=current_user.email #여기다가는 유저 이름을 저장한다.(나중에 수정할것)
#                 @reservation.professor=params[:professor]
#                 @reservation.date=params[:date]
#                 @reservation.start_time=Time.new(@date.year, @date.month, @date.day, @start_time.hour, @start_time.min)
#                 @reservation.finish_time=Time.new(@date.year, @date.month, @date.day, @finish_time.hour, @finish_time.min)
#                 @reservation.purpose=params[:purpose]
#                 @reservation.save
                
#                 redirect_to action:"view_booking", id: params[:id], show_date: params[:date]
                
#             end
#         else
#             redirect_to '/message/main'
#         end    
        
#     end
# end
    #if (r.start_time..r.finish_time).include?(@reservation.start_time) or (r.start_time..r.finish_time).include?(@reservation.finish_time)
                    #if (r.start_time..r.finish_time).overlaps?(@reservation.start_time..@reservation.finish_time).sds #만약 시간이 겹치면
                    
    #if (r.start_time, r.finish_time).include?(@start_time) or (r.start_time, r.finish_time).include?(@finis_time)
                    #if (@start_time.between?(r.start_time, r.finish_time)@finish_time.between?(r.start_time, r.finish_time))
                    # if (@reservation.where((:start_time === r.start_time..r.finish_time) || (:finish_time === r.start_time..r.finish_time)))
                        # @reservation.save
                        # redirect_to :back
                        
                          # @range=r.start_time..r.finish_time
                
                # if (@range.overlaps?(@start_time..@finish_time)or 
                #     @range.include?(@start_time) or 
                #     @range.include?(@finish_time))
                    
                    
                    # @reservation=Reservation.new #새로운 예약 db를 생성
                    # @reservation.room_id=params[:id]
                    # @reservation.user=current_user.email #여기다가는 유저 이름을 저장한다.(나중에 수정할것)
                    # @reservation.professor=params[:professor]
                    # @reservation.date=params[:date]
                    # @reservation.start_time=@start_time
                    # @reservation.finish_time=@finish_time
                    # @reservation.purpose=params[:purpose]
                    # @reservation.save
                    
                    # redirect_to action:"view_booking", id: params[:id], show_date: params[:date]