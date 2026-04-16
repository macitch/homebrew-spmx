class Spmx < Formula                                                                                            
   desc "The dependency commands Swift Package Manager forgot to ship"                                           
   homepage "https://github.com/macitch/spmx"                                                                    
   url "https://github.com/macitch/spmx/releases/download/v0.1.1/spmx-0.1.1-macos.tar.gz"                        
   sha256 "13ed8aff1e0860ab0cdb51621e255e4589fb027c58c477d66fa79d6b974d9de5"
   license "MIT"                                                                                                 
   head "https://github.com/macitch/spmx.git", branch: "main"    
                                                                                                                  
   depends_on :macos                                             
   depends_on xcode: ["16.0", :build] if build.head?                                                             
                                                                  
  def install
    if build.head?
      system "swift", "build", "-c", "release", "--disable-sandbox"
      bin.install ".build/release/spmx"                                                                         
    else
      bin.install "spmx"                                                                                        
    end                                                         
  end
    test do
      assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/spmx --version"))
  end                                                                                                           
end
