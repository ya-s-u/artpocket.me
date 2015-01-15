module Jpmobile
  module RequestWithMobile

    # OVERRIDE: タブレットはスマートフォンに含まない
    def smart_phone?
      mobile and mobile.smart_phone? and !mobile.tablet?
    end
  end
end
