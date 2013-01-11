Pod::Spec.new do |s|
  s.name = 'XMPPFramework'
  s.version = '3.5'
  s.license = 'BSD'
  s.summary = 'An XMPP Framework in Objective-C for the Mac / iOS development community.'
  s.homepage = 'https://github.com/robbiehanson/XMPPFramework'
  s.author = { 'Robbie Hanson' => 'robbiehanson@deusty.com' }
  s.source = { :git => 'https://github.com/robbiehanson/XMPPFramework.git', :tag => '3.5' }

  s.description = 'XMPPFramework provides a core implementation of RFC-3920 (the xmpp standard), along with
                  the tools needed to read & write XML. It comes with multiple popular extensions (XEP\'s),
                  all built atop a modular architecture, allowing you to plug-in any code needed for the job.
                  Additionally the framework is massively parallel and thread-safe. Structured using GCD,
                  this framework performs well regardless of whether it\'s being run on an old iPhone, or
                  on a 12-core Mac Pro. (And it won\'t block the main thread... at all).'
  s.requires_arc = true

  s.subspec 'Core' do |core|
    core.source_files = FileList['Core/**/*.{h,m}','Vendor/libidn/*.h'].exclude('**/XMPPFramework.h')
    core.resource = "Vendor/libidn/libidn.a"
    core.libraries = 'xml2','resolv','idn'
    core.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2 $(SDKROOT)/usr/include/libresolv',
                      'LIBRARY_SEARCH_PATHS' => '$(PODS_ROOT)/XMPPFramework/Vendor/libidn'}
    
    core.dependency 'XMPPFramework/Authentication'
    core.dependency 'XMPPFramework/Categories'
    core.dependency 'XMPPFramework/Utilities'
    core.ios.dependency 'XMPPFramework/KissXML'
    core.dependency 'CocoaLumberjack','~>1.6'
    core.dependency 'CocoaAsyncSocket','~>0.0.1'
  end
  
  s.subspec 'Authentication' do |authentication|
   authentication.source_files =  'Authentication/**/*.{h,m}'
   authentication.dependency 'XMPPFramework/Core'
  end

  s.subspec 'Categories' do |categories|
   categories.source_files =  'Categories/**/*.{h,m}'
   categories.dependency 'XMPPFramework/Core'
  end

  s.subspec 'Utilities' do |utilities|
   utilities.source_files =  'Utilities/**/*.{h,m}'
   utilities.dependency 'XMPPFramework/Core'
  end

  s.subspec 'KissXML' do |kissxml|
   kissxml.source_files = 'Vendor/KissXML/**/*.{h,m}'
   kissxml.dependency 'XMPPFramework/Core'
  end

  s.subspec 'BandwidthMonitor' do |bwm|
    bwm.source_files = 'Extensions/BandwidthMonitor'
    bwm.dependency 'XMPPFramework/Core'
  end

  s.subspec 'CoreDataStorage' do |cds|
    cds.source_files = 'Extensions/CoreDataStorage/**/*.{h,m}'
    cds.framework  = 'CoreData'
    cds.dependency 'XMPPFramework/Core'
  end

  s.subspec 'ProcessOne' do |po|
    po.source_files = 'Extensions/ProcessOne/**/*.{h,m}'
    po.dependency 'XMPPFramework/Core'
  end

  s.subspec 'Reconnect' do |rc|
    rc.source_files = 'Extensions/Reconnect/**/*.{h,m}'
    rc.framework = 'SystemConfiguration'
    rc.dependency 'XMPPFramework/Core'
  end

  s.subspec 'Roseter' do |rs|
    rs.source_files = 'Extensions/Roster/**/*.{h,m}'
    rs.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0009' do |xep0009|
    xep0009.source_files = 'Extensions/XEP-0009/**/*.{h,m}'
    xep0009.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0016' do |xep0016|
    xep0016.source_files = 'Extensions/XEP-0016/**/*.{h,m}'
    xep0016.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0045' do |xep0045|
    xep0045.source_files = 'Extensions/XEP-0045/**/*.{h,m}'
    xep0045.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0054' do |xep0054|
    xep0054.source_files = 'Extensions/XEP-0054/**/*.{h,m}'
    xep0054.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0060' do |xep0060|
    xep0060.source_files = 'Extensions/XEP-0060/**/*.{h,m}'
    xep0060.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0065' do |xep0065|
    xep0065.source_files = 'Extensions/XEP-0065/**/*.{h,m}'
    xep0065.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0082' do |xep0082|
    xep0082.source_files = 'Extensions/XEP-0082/**/*.{h,m}'
    xep0082.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0085' do |xep0085|
    xep0085.source_files = 'Extensions/XEP-0085/**/*.{h,m}'
    xep0085.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0100' do |xep0100|
    xep0100.source_files = 'Extensions/XEP-0100/**/*.{h,m}'
    xep0100.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0115' do |xep0115|
    xep0115.source_files = 'Extensions/XEP-0115/**/*.{h,m}'
    xep0115.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0136' do |xep0136|
    xep0136.source_files = 'Extensions/XEP-0136/**/*.{h,m}'
    xep0136.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0153' do |xep0153|
    xep0153.source_files = 'Extensions/XEP-0153/**/*.{h,m}'
    xep0153.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0184' do |xep0184|
    xep0184.source_files = 'Extensions/XEP-0184/**/*.{h,m}'
    xep0184.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0199' do |xep0199|
    xep0199.source_files = 'Extensions/XEP-0199/**/*.{h,m}'
    xep0199.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0202' do |xep0202|
    xep0202.source_files = 'Extensions/XEP-0202/**/*.{h,m}'
    xep0202.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0203' do |xep0203|
    xep0203.source_files = 'Extensions/XEP-0203/**/*.{h,m}'
    xep0203.dependency 'XMPPFramework/Core'
  end

  s.subspec 'XEP0224' do |xep0224|
    xep0224.source_files = 'Extensions/XEP-0224/**/*.{h,m}'
    xep0224.dependency 'XMPPFramework/Core'
  end

end
