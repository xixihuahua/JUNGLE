var topics = new Array();
topics[0] = "Bootstrap是美国Twitter公司的设计师Mark Otto和Jacob Thornton合作基于" +
		"HTML、CSS、JavaScript 开发的简洁、直观、强悍的前端开发框架，使得 Web " +
		"开发更加快捷。Bootstrap提供了优雅的HTML和CSS规范，它即是由动态CSS语言Less写成。";
topics[1] = "Servlet（Server Applet）是Java Servlet的简称，称为小服务程序或服务连接器，用Java编写的服务器端程序，主要功能在于交互式地浏览和修改数据，生成动态Web内容。" +
		"狭义的Servlet是指Java语言实现的一个接口，广义的Servlet是指任何实现了这个Servlet接口的类，" +
		"一般情况下，人们将Servlet理解为后者。Servlet运行于支持" +
		"Java的应用服务器中。从原理上讲，Servlet可以响应任何类型的请求，" +
		"但绝大多数情况下Servlet只用来扩展基于HTTP协议的Web服务器。";
topics[2] = "JDBC（Java DataBase Connectivity,java数据库连接）是一种用于执行SQL语句的Java API，" +
		"可以为多种关系数据库提供统一访问，它由一组用Java语言编写的类和接口组成。" +
		"JDBC提供了一种基准，据此可以构建更高级的工具和接口，" +
		"使数据库开发人员能够编写数据库应用程序，同时，JDBC也是个商标名。";
topics[3] = "JavaScript一种直译式脚本语言，是一种动态类型、弱类型、基于原型的语言，内置支持类型。" +
		"它的解释器被称为JavaScript引擎，为浏览器的一部分，广泛用于客户端的脚本语言，" +
		"最早是在HTML（标准通用标记语言下的一个应用）网页上使用，" +
		"用来给HTML网页增加动态功能。";
topics[4] = "JSON(JavaScript Object Notation, JS 对象简谱) 是一种轻量级的数据交换格式。" +
		"它基于 ECMAScript (欧洲计算机协会制定的js规范)的一个子集，" +
		"采用完全独立于编程语言的文本格式来存储和表示数据。" +
		"简洁和清晰的层次结构使得 JSON 成为理想的数据交换语言。 " +
		"易于人阅读和编写，同时也易于机器解析和生成，并有效地提升网络传输效率。";
topics[5] = "XML 指可扩展标记语言（EXtensible Markup Language）;它是一种标记语言，很类似 HTML;" +
		"它的设计宗旨是传输数据，而非显示数据;标签没有被预定义。" +
		"您需要自行定义标签。它被设计为具有自我描述性。它是 W3C 的推荐标准";
topics[6] = "结构化查询语言，简称SQL，是一种特殊目的的编程语言，是一种数据库查询和程序设计语言，" +
		"用于存取数据以及查询、更新和管理关系数据库系统；同时也是数据库脚本文件的扩展名。" +
		"结构化查询语言是高级的非过程化编程语言，" +
		"允许用户在高层数据结构上工作。" +
		"它不要求用户指定对数据的存放方法，也不需要用户了解具体的数据存放方式，" +
		"所以具有完全不同底层结构的不同数据库系统, 可以使用相同的结构化查询语言作为数据输入与管理的接口。" +
		"结构化查询语言语句可以嵌套，这使它具有极大的灵活性和强大的功能。";
topics[7] = "SSM（Spring+SpringMVC+MyBatis）框架集由Spring、MyBatis两个开源框架整合而成" +
		"（SpringMVC是Spring中的部分内容）。" +
		"常作为数据源较简单的web项目的框架。";
topics[8] = "Hibernate是一个开放源代码的对象关系映射框架，" +
		"它对JDBC进行了非常轻量级的对象封装，" +
		"它将POJO与数据库表建立映射关系，是一个全自动的orm框架，" +
		"hibernate可以自动生成SQL语句，自动执行，" +
		"使得Java程序员可以随心所欲的使用对象编程思维来操纵数据库。" +
		" Hibernate可以应用在任何使用JDBC的场合，既可以在Java的客户端程序使用，" +
		"也可以在Servlet/JSP的Web应用中使用，最具革命意义的是，" +
		"Hibernate可以在应用EJB的JaveEE架构中取代CMP，完成数据持久化的重任。";
topics[9] = "MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，" +
		"目前属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，" +
		"在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件。" +
		"MySQL是一种关系数据库管理系统，关系数据库将数据保存在不同的表中，" +
		"而不是将所有数据放在一个大仓库内，这样就增加了速度并提高了灵活性。";
topics[10] = "Oracle Database，又名Oracle RDBMS，或简称Oracle。" +
		"是甲骨文公司的一款关系数据库管理系统。它是在数据库领域一直处于领先地位的产品" +
		"。可以说Oracle数据库系统是目前世界上流行的关系数据库管理系统，" +
		"系统可移植性好、使用方便、功能强，适用于各类大、中、小、微机环境。" +
		"它是一种高效率、可靠性好的 适应高吞吐量的数据库解决方案。";
topics[11] = "SQL Server 是Microsoft 公司推出的关系型数据库管理系统。" +
		"具有使用方便可伸缩性好与相关软件集成程度高等优点，" +
		"可跨越从运行Microsoft Windows 98 的膝上型电脑到运行Microsoft Windows 2012 的大型多处理器的服务器等多种平台使用。" +
		"Microsoft SQL Server 是一个全面的数据库平台，使用集成的商业智能 (BI)工具提供了企业级的数据管理。" +
		"Microsoft SQL Server 数据库引擎为关系型数据和结构化数据提供了更安全可靠的存储功能，" +
		"使您可以构建和管理用于业务的高可用和高性能的数据应用程序。";
topics[12] = "Spring是一个开放源代码的设计层面框架，" +
		"他解决的是业务逻辑层和其他各层的松耦合问题，" +
		"因此它将面向接口的编程思想贯穿整个系统应用。" +
		"Spring是于2003 年兴起的一个轻量级的Java 开发框架，由Rod Johnson创建。" +
		"简单来说，Spring是一个分层的JavaSE/EE full-stack(一站式) 轻量级开源框架。";
topics[13] = "超级文本标记语言是标准通用标记语言下的一个应用，也是一种规范，一种标准，" +
		"它通过标记符号来标记要显示的网页中的各个部分。网页文件本身是一种文本文件，" +
		"通过在文本文件中添加标记符，可以告诉浏览器如何显示其中的内容（如：文字如何处理，画面如何安排，图片如何显示等）。";
topics[14] = "层叠样式表(英文全称：Cascading Style Sheets)是一种用来表现HTML" +
		"（标准通用标记语言的一个应用）或XML（标准通用标记语言的一个子集）" +
		"等文件样式的计算机语言。CSS不仅可以静态地修饰网页，还可以配合各种脚本语言动态地对网页各元素进行格式化。" +
		"CSS 能够对网页中元素位置的排版进行像素级精确控制，支持几乎所有的字体字号样式，拥有对网页对象和模型样式编辑的能力。";
topics[15] = "jQuery是一个快速、简洁的JavaScript框架，是继Prototype之后又一个优秀的JavaScript代码库（或JavaScript框架）。" +
		"jQuery设计的宗旨是“write Less，Do More”，即倡导写更少的代码，做更多的事情。" +
		"它封装JavaScript常用的功能代码，提供一种简便的JavaScript设计模式，优化HTML文档操作、事件处理、动画设计和Ajax交互。";
topics[16] = "Ajax 即“Asynchronous Javascript And XML”（异步 JavaScript 和 XML），是指一种创建交互式网页应用的网页开发技术。" +
		"Ajax = 异步 JavaScript 和 XML（标准通用标记语言的子集）。" +
		"Ajax 是一种用于创建快速动态网页的技术。" +
		"Ajax 是一种在无需重新加载整个网页的情况下，能够更新部分网页的技术。" +
		"通过在后台与服务器进行少量数据交换，Ajax 可以使网页实现异步更新。" +
		"这意味着可以在不重新加载整个网页的情况下，对网页的某部分进行更新。";
topics[17] = "Struts是Apache软件基金会（ASF）赞助的一个开源项目。" +
		"它最初是Jakarta项目中的一个子项目，并在2004年3月成为ASF的顶级项目。" +
		"它通过采用Java Servlet/JSP技术，实现了基于Java EE Web应用的Model-View-Controller（MVC）设计模式的应用框架，" +
		"是MVC经典设计模式中的一个经典产品。";
topics[18] = "Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，" +
		"还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。" +
		"Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程。" +
		"Java具有简单性、面向对象、分布式、健壮性、安全性、平台独立与可移植性、多线程、动态性等特点。" +
		"Java可以编写桌面应用程序、Web应用程序、分布式系统和嵌入式系统应用程序等";
topics[19] = "MVC全名是Model View Controller，是模型(model)－视图(view)－控制器(controller)的缩写，" +
		"一种软件设计典范，用一种业务逻辑、数据、界面显示分离的方法组织代码，" +
		"将业务逻辑聚集到一个部件里面，在改进和个性化定制界面及用户交互的同时，" +
		"不需要重新编写业务逻辑。MVC被独特的发展起来用于映射传统的输入、" +
		"处理和输出功能在一个逻辑的图形化用户界面的结构中。";
 function toNum( topic ){
	 if(topic == 'bootstrap'){
		 return 0;
	 }else if(topic == 'servlet'){
		 return 1;
	 }else if(topic == 'jdbc'){
		 return 2;
	 }else if(topic == 'javascript'){
		 return 3;
	 }else if(topic == 'json'){
		 return 4;
	 }else if(topic == 'xml'){
		 return 5;
	 }else if(topic == 'sql'){
		 return 6;
	 }else if(topic == 'ssm'){
		 return 7;
	 }else if(topic == 'hibernate'){
		 return 8;
	 }else if(topic == 'mysql'){
		 return 9;
	 }else if(topic == 'oracle'){
		 return 10;
	 }else if(topic == 'sqlServer'){
		 return 11;
	 }else if(topic == 'spring'){
		 return 12;
	 }else if(topic == 'html'){
		 return 13;
	 }else if(topic == 'css'){
		 return 14;
	 }else if(topic == 'ajax'){
		 return 15;
	 }else if(topic == 'struts'){
		 return 16;
	 }else if(topic == 'java'){
		 return 17;
	 }else if(topic == 'mvc'){
		 return 18;
	 }else{
		 return 19;
	 }
	 
 }