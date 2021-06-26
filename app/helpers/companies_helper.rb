module CompaniesHelper
  def third_step_placeholder 
    <<-"EOS".strip_heredoc
    ・あなたの会社のサービスは、どのような実績をあげていますか？
    ・プロダクトの強みとして、自慢できるポイントはなんですか？
    ・あなたの会社は、これからどのような展開をしていきますか？
    EOS
  end

  def fourth_step_placeholder
    <<-"EOS".strip_heredoc
    ・あなたの会社が理想として掲げる理念はなんですか？
    ・企業活動を通して果たすべき使命（ミッション）はありますか？
    ・どのような志を持つ方を仲間に入れたいですか？
    EOS
  end

  def fifth_step_placeholder
    <<-"EOS".strip_heredoc
    ・あなたの会社では、どのような行動指針を大切にしていますか？
    ・チーム、職場はどのような雰囲気ですか？
    ・企業文化を支える、ユニークな制度はありますか？
    EOS
  end
  
  end
