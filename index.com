<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="中医体质与心理评估相结合的身心健康测评系统，提供个性化体质辨识和健康调理建议。">
    <meta name="keywords" content="中医体质, 心理评估, 健康测评, 体质辨识, 健康建议">
    
    <!-- Open Graph Graph 标签 -->
    <meta property="og:title" content="身心健康测评系统 - 中医体质与心理评估">
    <meta property="og:description" content="通过中医九种体质辨识与心理评估，为您提供个性化健康调理建议。">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://example.com/health-assessment">
    <meta property="og:image" content="https://picsum.photos/id/1080/800/400">
    <meta property="og:locale" content="zh_CN">
    
    <!-- 安全相关标签 -->
    <meta http-equiv="X-XSS-Protection" content="1; mode=block">
    <meta http-equiv="X-Content-Type-Options" content="nosniff">
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline'; img-src 'self' data: https://picsum.photos;">
    
    <title>身心健康测评 - 中医体质与心理评估</title>
    <style>
        :root {
            --primary: #6a994e;
            --secondary: #a7c957;
            --accent: #f2e8cf;
            --dark: #386641;
            --light: #f8f9fa;
            --danger: #bc4749;
            --shadow: rgba(0, 0, 0, 0.1);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Microsoft YaHei', '微软雅黑', sans-serif;
        }
        
        body {
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
        
        header {
            text-align: center;
            padding: 30px 0;
            background: linear-gradient(135deg, var(--primary) 0%, var(--dark) 100%);
            color: white;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 4px 12px var(--shadow);
        }
        
        h1 {
            font-size: 2.2rem;
            margin-bottom: 10px;
        }
        
        .subtitle {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        .progress-container {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px var(--shadow);
        }
        
        .progress-bar {
            height: 12px;
            background-color: #e9ecef;
            border-radius: 10px;
            overflow: hidden;
        }
        
        .progress {
            height: 100%;
            background: linear-gradient(90deg, var(--secondary) 0%, var(--primary) 100%);
            border-radius: 10px;
            width: 0%;
            transition: width 0.5s ease;
        }
        
        .question-container {
            background-color: white;
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px var(--shadow);
        }
        
        .question-title {
            font-size: 1.2rem;
            margin-bottom: 15px;
            color: var(--dark);
            font-weight: 600;
        }
        
        .options {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
        }
        
        .option {
            flex: 1;
            min-width: 200px;
            padding: 15px;
            background-color: var(--accent);
            border: 2px solid transparent;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .option:hover {
            background-color: var(--secondary);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .option.selected {
            background-color: var(--primary);
            color: white;
            border-color: var(--dark);
        }
        
        .option:focus {
            outline: 3px solid var(--secondary);
            outline-offset: 2px;
        }
        
        .nav-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        
        button {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        button:focus {
            outline: 3px solid var(--secondary);
            outline-offset: 2px;
        }
        
        .btn-prev {
            background-color: #e9ecef;
            color: #495057;
        }
        
        .btn-prev:hover {
            background-color: #dee2e6;
            transform: translateY(-2px);
        }
        
        .btn-next {
            background-color: var(--primary);
            color: white;
        }
        
        .btn-next:hover {
            background-color: var(--dark);
            transform: translateY(-2px);
        }
        
        .btn-submit {
            background-color: var(--dark);
            color: white;
            display: none;
        }
        
        .btn-submit:hover {
            background-color: #2a4c33;
            transform: translateY(-2px);
        }
        
        .report-container {
            display: none;
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            margin-top: 20px;
            box-shadow: 0 4px 12px var(--shadow);
            animation: fadeIn 0.5s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .report-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .constitution-result, .mental-result {
            margin-bottom: 30px;
            padding: 20px;
            background-color: var(--accent);
            border-radius: 8px;
        }
        
        .suggestions {
            background-color: var(--accent);
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
        }
        
        .suggestion-section {
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(56, 102, 65, 0.2);
        }
        
        .suggestion-section:last-child {
            border-bottom: none;
        }
        
        .suggestion-section h4 {
            margin-bottom: 10px;
            color: var(--dark);
            font-size: 1.1rem;
        }
        
        .recipe-list, .exercise-list, .general-list {
            padding-left: 20px;
            margin-top: 10px;
        }
        
        .recipe-item, .exercise-item, .general-item {
            margin-bottom: 15px;
        }
        
        .recipe-item strong, .exercise-item strong {
            color: var(--dark);
        }
        
        footer {
            text-align: center;
            margin-top: 40px;
            padding: 20px;
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        .restart-btn {
            display: block;
            margin: 30px auto 0;
            background-color: var(--primary);
            color: white;
        }
        
        .restart-btn:hover {
            background-color: var(--dark);
            transform: translateY(-2px);
        }
        
        /* 辅助元素 */
        .sr-only {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            white-space: nowrap;
            border-width: 0;
        }
        
        @media (max-width: 768px) {
            .options {
                flex-direction: column;
            }
            
            .option {
                min-width: 100%;
            }
            
            h1 {
                font-size: 1.8rem;
            }
            
            .question-container, .progress-container, .report-container {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container" role="main">
        <header role="banner">
            <h1>身心健康测评系统</h1>
            <p class="subtitle">中医九种体质辨识与心理评估相结合，为您提供个性化调理建议</p>
        </header>
        
        <div class="progress-container" role="region" aria-label="问卷进度">
            <div class="progress-bar">
                <div class="progress" id="progress" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <p style="text-align: center; margin-top: 10px;" id="progress-text">问题 0/29</p>
        </div>
        
        <div class="question-container" id="question-container" role="form" aria-labelledby="question-aria-label">
            <h2 class="sr-only" id="question-aria-label">问卷问题</h2>
            <div class="question-title" id="question"></div>
            <div class="options" id="options" role="radiogroup" aria-labelledby="question"></div>
            
            <div class="nav-buttons">
                <button class="btn-prev" id="btn-prev" aria-label="上一题">上一题</button>
                <button class="btn-next" id="btn-next" aria-label="下一题">下一题</button>
                <button class="btn-submit" id="btn-submit" aria-label="提交问卷">提交问卷</button>
            </div>
        </div>
        
        <div class="report-container" id="report-container" role="region" aria-label="健康报告结果">
            <div class="report-header">
                <h2>您的个性化健康报告</h2>
                <p>基于中医体质辨识和心理评估的综合分析</p>
            </div>
            
            <div class="constitution-result">
                <h3>中医体质分析</h3>
                <p id="constitution-result"></p>
            </div>
            
            <div class="mental-result">
                <h3>心理状态评估</h3>
                <p id="mental-result"></p>
            </div>
            
            <div class="suggestions">
                <h3>个性化调理建议</h3>
                
                <div class="suggestion-section">
                    <h4>饮食建议</h4>
                    <div class="recipe-list" id="recipe-suggestions"></div>
                </div>
                
                <div class="suggestion-section">
                    <h4>运动建议</h4>
                    <div class="exercise-list" id="exercise-suggestions"></div>
                </div>
                
                <div class="suggestion-section">
                    <h4>生活调理建议</h4>
                    <ul class="general-list" id="general-suggestions"></ul>
                </div>
            </div>
            
            <button class="restart-btn" id="restart-btn" aria-label="重新开始测评">重新测评</button>
        </div>
        
        <footer role="contentinfo">
            <p>© 2025 身心健康测评系统 | 本测评仅供参考，不作为医疗诊断依据</p>
        </footer>
    </div>

    <script>
        // 问题数据
        const questions = [
            // 中医体质问题 (1-19)
            {
                category: "constitution",
                text: "您容易疲劳吗？",
                options: ["非常容易", "比较容易", "一般", "不太容易", "从来不会"]
            },
 			{
                category: "constitution",
                text: "您容易气短（呼吸短促，接不上气）吗？",
                options: ["没有", "很少", "有时", "经常", "总是"],
            },
            {
                category: "constitution",
                text: "您怕冷吗？",
                options: ["非常怕冷", "比较怕冷", "一般", "不太怕冷", "完全不怕"]
            },
            {
                category: "constitution",
                text: "您手脚发凉吗？",
                options: ["经常", "有时", "一般", "很少", "从不"]
            },
            {
                category: "constitution",
                text: "您胃脘部、背部或腰膝部怕冷吗",
                options: ["经常", "有时", "一般", "很少", "从不"]
            },
            {
                category: "constitution",
                text: "您感觉身体沉重吗？",
                options: ["经常", "有时", "一般", "很少", "从不"]
            },
  	        {
                category: "constitution",
                text: "您腹部肥满松软吗？",
                options: ["非常", "比较", "一般", "不太", "不会"]
            },
            {
                category: "constitution",
                text: "您面部油腻吗？",
                options: ["非常油腻", "比较油腻", "一般", "比较干燥", "非常干燥"]
            },
            {
                category: "constitution",
                text: "您容易长痘或疮疡吗？",
                options: ["非常容易", "比较容易", "一般", "不太容易", "从来不会"]
            },
			{
                category: "constitution",
                text: "大便黏滞不畅？",
                options: ["非常容易", "比较容易", "一般", "不太容易", "从来不会"]
            },
            {
                category: "constitution",
                text: "您面色晦暗或有色素沉着吗？",
                options: ["非常明显", "比较明显", "一般", "不太明显", "没有"]
            },
            {
                category: "constitution",
                text: "您口唇可能发黯或舌头颜色偏紫",
                options: ["非常明显", "比较明显", "一般", "不太明显", "没有"]
            },
            {
                category: "constitution",
                text: "您感到闷闷不乐、情绪低沉吗？",
                options: ["非常容易", "比较容易", "一般", "不太容易", "从来不会"]
            },
            {
                category: "constitution",
                text: "您容易精神紧张、焦虑不安吗？",
                options: ["非常容易", "比较容易", "一般", "不太容易", "从来不会"]
            },
	        {
                category: "constitution",
                text: "您容易过敏(对药物、食物、气味、花粉或在季节交替、气候变化时)吗？",
                options: ["非常容易", "比较容易", "一般", "不太容易", "从来不会"]
            },
	        {
                category: "constitution",
                text: "您没有感冒时也会打喷嚏吗？",
                options: ["非常容易", "比较容易", "一般", "不太容易", "从来不会"]
            },
            {
                category: "constitution",
                text: "您容易口干咽燥吗？",
                options: ["非常容易", "比较容易", "一般", "不太容易", "从来不会"]
            },
            {
                category: "constitution",
                text: "您感觉身体、脸上发热吗？",
                options: ["非常容易", "比较容易", "一般", "不太容易", "从来不会"]
            },
            {
                category: "constitution",
                text: "您感到手脚心发热吗？",
                options: ["非常容易", "比较容易", "一般", "不太容易", "从来不会"]
            },
            
            // 心理评估问题 (20-29)
            {
                category: "mental",
                text: "您最近感到情绪低落吗？",
                options: ["总是", "经常", "有时", "很少", "从不"]
            },
            {
                category: "mental",
                text: "您容易感到焦虑或紧张吗？",
                options: ["总是", "经常", "有时", "很少", "从不"]
            },
            {
                category: "mental",
                text: "您睡眠质量如何？",
                options: ["非常差", "较差", "一般", "较好", "非常好"]
            },
            {
                category: "mental",
                text: "您容易感到愤怒或烦躁吗？",
                options: ["总是", "经常", "有时", "很少", "从不"]
            },
            {
                category: "mental",
                text: "您对日常生活感兴趣吗？",
                options: ["毫无兴趣", "兴趣不大", "一般", "比较感兴趣", "非常感兴趣"]
            },
            {
                category: "mental",
                text: "您容易感到压力吗？",
                options: ["压力极大", "压力较大", "一般", "压力较小", "毫无压力"]
            },
            {
                category: "mental",
                text: "您能够集中注意力吗？",
                options: ["完全不能", "比较困难", "一般", "比较容易", "非常容易"]
            },
            {
                category: "mental",
                text: "您对自己的满意度如何？",
                options: ["非常不满意", "不太满意", "一般", "比较满意", "非常满意"]
            },
            {
                category: "mental",
                text: "您的人际关系如何？",
                options: ["非常差", "较差", "一般", "较好", "非常好"]
            },
            {
                category: "mental",
                text: "您经常感到身心疲惫吗？",
                options: ["总是", "经常", "有时", "很少", "从不"]
            }
        ];

        // 初始化变量
        let currentQuestion = 0;
        let answers = [];
        const progressBar = document.getElementById('progress');
        const progressText = document.getElementById('progress-text');
        const questionElement = document.getElementById('question');
        const optionsElement = document.getElementById('options');
        const btnPrev = document.getElementById('btn-prev');
        const btnNext = document.getElementById('btn-next');
        const btnSubmit = document.getElementById('btn-submit');
        const questionContainer = document.getElementById('question-container');
        const reportContainer = document.getElementById('report-container');
        const constitutionResult = document.getElementById('constitution-result');
        const mentalResult = document.getElementById('mental-result');
        const recipeSuggestions = document.getElementById('recipe-suggestions');
        const exerciseSuggestions = document.getElementById('exercise-suggestions');
        const generalSuggestions = document.getElementById('general-suggestions');
        const restartBtn = document.getElementById('restart-btn');

        // 初始化问卷
        function initQuestionnaire() {
            showQuestion(0);
            updateProgress();
            
            // 添加事件监听器
            btnPrev.addEventListener('click', prevQuestion);
            btnNext.addEventListener('click', nextQuestion);
            btnSubmit.addEventListener('click', submitQuestionnaire);
            restartBtn.addEventListener('click', restartQuestionnaire);
            
            // 添加键盘导航支持
            document.addEventListener('keydown', function(e) {
                if (reportContainer.style.display === 'none') {
                    if (e.key === 'ArrowRight') {
                        if (currentQuestion < questions.length - 1) {
                            if (answers[currentQuestion] !== undefined) {
                                nextQuestion();
                            }
                        } else if (answers[currentQuestion] !== undefined) {
                            submitQuestionnaire();
                        }
                    } else if (e.key === 'ArrowLeft' && currentQuestion > 0) {
                        prevQuestion();
                    } else if (e.key >= '1' && e.key <= '5') {
                        // 数字键1-5选择选项
                        const optionIndex = parseInt(e.key) - 1;
                        if (optionIndex >= 0 && optionIndex < questions[currentQuestion].options.length) {
                            selectOption(currentQuestion, optionIndex);
                            // 选择后自动聚焦到下一个按钮
                            if (currentQuestion < questions.length - 1) {
                                btnNext.focus();
                            } else {
                                btnSubmit.focus();
                            }
                        }
                    }
                }
            });
        }

        // 显示当前问题
        function showQuestion(index) {
            const question = questions[index];
            questionElement.textContent = `${index + 1}. ${question.text}`;
            
            // 更新ARIA属性
            optionsElement.setAttribute('aria-labelledby', questionElement.id);
            
            // 清空选项
            optionsElement.innerHTML = '';
            
            // 添加选项
            question.options.forEach((option, i) => {
                const optionElement = document.createElement('div');
                optionElement.className = 'option';
                optionElement.setAttribute('role', 'radio');
                optionElement.setAttribute('tabindex', '0');
                optionElement.setAttribute('aria-checked', 'false');
                optionElement.setAttribute('aria-label', `${i + 1}. ${option}`);
                
                if (answers[index] === i) {
                    optionElement.classList.add('selected');
                    optionElement.setAttribute('aria-checked', 'true');
                }
                
                optionElement.textContent = `${i + 1}. ${option}`;
                optionElement.addEventListener('click', () => selectOption(index, i));
                
                // 添加键盘支持
                optionElement.addEventListener('keydown', (e) => {
                    if (e.key === 'Enter' || e.key === ' ') {
                        e.preventDefault();
                        selectOption(index, i);
                    }
                });
                
                optionsElement.appendChild(optionElement);
            });
            
            // 更新按钮状态
            btnPrev.style.display = index === 0 ? 'none' : 'block';
            btnNext.style.display = index === questions.length - 1 ? 'none' : 'block';
            btnSubmit.style.display = index === questions.length - 1 ? 'block' : 'none';
            
            // 为屏幕阅读器添加问题变化通知
            const announcement = document.createElement('div');
            announcement.setAttribute('aria-live', 'polite');
            announcement.className = 'sr-only';
            announcement.textContent = `现在是第${index + 1}题`;
            document.body.appendChild(announcement);
            setTimeout(() => document.body.removeChild(announcement), 1000);
            
            // 平滑滚动到问题区域
            questionContainer.scrollIntoView({ behavior: 'smooth', block: 'start' });
            
            // 设置焦点
            if (answers[index] !== undefined) {
                const options = optionsElement.querySelectorAll('.option');
                options[answers[index]].focus();
            } else {
                // 默认聚焦到第一个选项
                const firstOption = optionsElement.querySelector('.option');
                if (firstOption) firstOption.focus();
            }
        }

        // 选择选项
        function selectOption(questionIndex, optionIndex) {
            answers[questionIndex] = optionIndex;
            
            // 更新选项样式和ARIA属性
            const options = optionsElement.querySelectorAll('.option');
            options.forEach((option, i) => {
                if (i === optionIndex) {
                    option.classList.add('selected');
                    option.setAttribute('aria-checked', 'true');
                    // 添加选中动画
                    option.style.transform = 'scale(1.02)';
                    setTimeout(() => {
                        option.style.transform = '';
                    }, 200);
                } else {
                    option.classList.remove('selected');
                    option.setAttribute('aria-checked', 'false');
                }
            });
        }

        // 更新进度
        function updateProgress() {
            const progress = ((currentQuestion + 1) / questions.length) * 100;
            progressBar.style.width = `${progress}%`;
            progressBar.setAttribute('aria-valuenow', progress);
            progressText.textContent = `问题 ${currentQuestion + 1}/${questions.length}`;
        }

        // 上一题
        function prevQuestion() {
            if (currentQuestion > 0) {
                currentQuestion--;
                showQuestion(currentQuestion);
                updateProgress();
            }
        }

        // 下一题
        function nextQuestion() {
            if (answers[currentQuestion] === undefined) {
                // 添加提示动画和ARIA通知
                questionElement.style.color = 'var(--danger)';
                
                const announcement = document.createElement('div');
                announcement.setAttribute('aria-live', 'assertive');
                announcement.className = 'sr-only';
                announcement.textContent = '请先选择一个选项';
                document.body.appendChild(announcement);
                setTimeout(() => {
                    questionElement.style.color = '';
                    document.body.removeChild(announcement);
                }, 1000);
                
                return;
            }
            
            if (currentQuestion < questions.length - 1) {
                currentQuestion++;
                showQuestion(currentQuestion);
                updateProgress();
            }
        }

        // 提交问卷
        function submitQuestionnaire() {
            if (answers[currentQuestion] === undefined) {
                // 添加提示动画和ARIA通知
                questionElement.style.color = 'var(--danger)';
                
                const announcement = document.createElement('div');
                announcement.setAttribute('aria-live', 'assertive');
                announcement.className = 'sr-only';
                announcement.textContent = '请先选择一个选项';
                document.body.appendChild(announcement);
                setTimeout(() => {
                    questionElement.style.color = '';
                    document.body.removeChild(announcement);
                }, 1000);
                
                return;
            }
            
            // 显示加载状态和ARIA通知
            questionElement.textContent = "正在生成您的健康报告...";
            optionsElement.innerHTML = '';
            btnPrev.style.display = 'none';
            btnSubmit.style.display = 'none';
            
            const announcement = document.createElement('div');
            announcement.setAttribute('aria-live', 'polite');
            announcement.className = 'sr-only';
            announcement.textContent = '正在处理您的回答，生成健康报告';
            document.body.appendChild(announcement);
            
            // 模拟处理时间
            setTimeout(() => {
                document.body.removeChild(announcement);
                
                // 生成报告
                generateReport();
                
                // 隐藏问卷，显示报告
                questionContainer.style.display = 'none';
                reportContainer.style.display = 'block';
                
                // 为屏幕阅读器添加报告生成通知
                const reportAnnouncement = document.createElement('div');
                reportAnnouncement.setAttribute('aria-live', 'polite');
                reportAnnouncement.className = 'sr-only';
                reportAnnouncement.textContent = '您的健康报告已生成';
                document.body.appendChild(reportAnnouncement);
                setTimeout(() => document.body.removeChild(reportAnnouncement), 1000);
                
                // 聚焦到报告标题
                reportContainer.querySelector('h2').focus();
            }, 1500);
        }

        // 重新开始测评
        function restartQuestionnaire() {
            currentQuestion = 0;
            answers = [];
            reportContainer.style.display = 'none';
            questionContainer.style.display = 'block';
            showQuestion(0);
            updateProgress();
        }

        // 生成报告
        function generateReport() {
            // 体质评分计算
            const constitutionScores = {
                "平和质": 0,
                "气虚质": 0,
                "阳虚质": 0,
                "阴虚质": 0,
                "痰湿质": 0,
                "湿热质": 0,
                "血瘀质": 0,
                "气郁质": 0,
                "特禀质": 0
            };
            
            // 评分逻辑
            constitutionScores["气虚质"] += (4 - answers[0] + 4 - answers[1]) / 2;
            constitutionScores["阳虚质"] += (4 - answers[2] + 4 - answers[3] + 4 - answers[4]) / 3;
            constitutionScores["痰湿质"] += (4 - answers[5] + 4 - answers[6]) / 2;
            constitutionScores["湿热质"] += (4 - answers[7] + 4 - answers[8] + 4 - answers[9]) / 3;
            constitutionScores["血瘀质"] += (4 - answers[10] + 4 - answers[11]) / 2;
            constitutionScores["气郁质"] += (4 - answers[12] + 4 - answers[13]) / 2;
            constitutionScores["特禀质"] += (4 - answers[14] + 4 - answers[15]) / 2;
            constitutionScores["阴虚质"] += (4 - answers[16] + 4 - answers[17] + 4 - answers[18]) / 3;
            
            // 找出主要体质
            let mainConstitution = "平和质";
            let maxScore = 0;
            
            for (const [type, score] of Object.entries(constitutionScores)) {
                if (score > maxScore) {
                    maxScore = score;
                    mainConstitution = type;
                }
            }
            
            // 分析心理状态
            const mentalScores = {
                "抑郁倾向": answers[19] + (4 - answers[23]),
                "焦虑倾向": answers[20] + answers[25],
                "压力水平": answers[24] + answers[25],
                "睡眠质量": 4 - answers[21],
                "自我认知": (4 - answers[26]) + (4 - answers[27])
            };
            
            let mentalState = "总体良好";
            if (mentalScores["抑郁倾向"] > 6 || mentalScores["焦虑倾向"] > 6) {
                mentalState = "需要关注";
            }
            if (mentalScores["抑郁倾向"] > 7 || mentalScores["焦虑倾向"] > 7) {
                mentalState = "需要特别关注";
            }
            
            // 显示结果
            constitutionResult.textContent = `您的体质类型主要是：${mainConstitution}。根据中医理论，这种体质的特点和调理方式如下。`;
            mentalResult.textContent = `您的心理状态${mentalState}。测评显示您的情绪健康方面有一些需要注意的地方。`;
            
            // 生成建议
            generateSuggestions(mainConstitution, mentalState, mentalScores);
        }

        // 生成个性化建议
        function generateSuggestions(constitution, mentalState, mentalScores) {
            // 清空之前的建议
            recipeSuggestions.innerHTML = '';
            exerciseSuggestions.innerHTML = '';
            generalSuggestions.innerHTML = '';
            
            // 定义各体质对应的饮食、运动和生活建议
            const constitutionSuggestions = {
                "气虚质": {
                    recipes: [
                        {
                            name: '黄芪炖鸡汤',
                            ingredients: '黄芪30g，鸡肉500g，枸杞15g，红枣5颗',
                            method: '将鸡肉切块焯水，与黄芪、红枣一同放入锅中，加水炖煮1小时，最后加入枸杞煮10分钟即可。',
                            benefit: '补气养血，增强免疫力'
                        },
                        {
                            name: '山药粥',
                            ingredients: '山药100g，大米50g，红枣5颗',
                            method: '山药去皮切块，与大米、红枣一同煮粥，煮至软烂即可。',
                            benefit: '健脾益气，补肺肾'
                        },
                        {
                            name: '人参红枣茶',
                            ingredients: '人参片5g，红枣10颗，冰糖适量',
                            method: '将人参片和红枣放入杯中，加入开水冲泡，加盖焖10分钟，加入冰糖调味。',
                            benefit: '补气养血，提神醒脑'
                        }
                    ],
                    exercises: [
                        {
                            name: '太极拳',
                            method: '每天练习30分钟，动作缓慢柔和，注重呼吸配合',
                            benefit: '补气养血，增强体质，改善心肺功能',
                            frequency: '每周3-5次'
                        },
                        {
                            name: '八段锦',
                            method: '重点练习"双手托天理三焦"和"调理脾胃须单举"两式',
                            benefit: '健脾益气，增强消化功能',
                            frequency: '每天1-2次'
                        },
                        {
                            name: '散步',
                            method: '每天散步30-45分钟，速度适中，不宜过快',
                            benefit: '温和运动，增强体力，改善循环',
                            frequency: '每天1次'
                        }
                    ],
                    general: [
                        "保证充足睡眠，避免过度劳累",
                        "可按足三里、气海等穴位健脾益气",
                        "避免过度思虑，保持心情舒畅"
                    ]
                },
                "阳虚质": {
                    recipes: [
                        {
                            name: '当归生姜羊肉汤',
                            ingredients: '羊肉500g，当归15g，生姜30g',
                            method: '羊肉切块焯水，与当归、生姜一同放入锅中，加水炖煮2小时，调味即可。',
                            benefit: '温阳散寒，补血活血'
                        },
                        {
                            name: '桂圆红枣茶',
                            ingredients: '桂圆肉20g，红枣10颗，红糖适量',
                            method: '将桂圆肉和红枣放入锅中，加水煮沸后转小火煮20分钟，加入红糖调味。',
                            benefit: '温补心脾，养血安神'
                        },
                        {
                            name: '韭菜炒虾仁',
                            ingredients: '韭菜200g，虾仁150g，生姜适量',
                            method: '韭菜切段，虾仁洗净，热锅爆香姜片，加入虾仁翻炒，再加入韭菜快速翻炒，调味即可。',
                            benefit: '补肾壮阳，温中行气'
                        }
                    ],
                    exercises: [
                        {
                            name: '晒太阳',
                            method: '每天上午9-10点或下午4-5点，背对太阳晒20-30分钟',
                            benefit: '补充阳气，温暖身体',
                            frequency: '每天1次'
                        },
                        {
                            name: '温灸',
                            method: '艾灸关元、气海、足三里等穴位，每穴10-15分钟',
                            benefit: '温阳散寒，增强阳气',
                            frequency: '每周2-3次'
                        },
                        {
                            name: '慢跑',
                            method: '慢速跑步20-30分钟，注意保暖',
                            benefit: '促进血液循环，温暖身体',
                            frequency: '每周3-4次'
                        }
                    ],
                    general: [
                        "多吃温性食物如羊肉、韭菜、生姜等，少食生冷",
                        "适当进行户外运动，多晒太阳",
                        "注意保暖，特别是腰背部和小腹",
                        "艾灸关元、命门等穴位有助温阳"
                    ]
                },
                "阴虚质": {
                    recipes: [
                        {
                            name: '银耳莲子羹',
                            ingredients: '银耳20g，莲子30g，冰糖适量',
                            method: '银耳泡发撕小朵，莲子去心，一同放入锅中加水煮至软烂，加入冰糖调味。',
                            benefit: '滋阴润肺，养心安神'
                        },
                        {
                            name: '百合粥',
                            ingredients: '鲜百合50g，大米50g，冰糖适量',
                            method: '大米煮粥，粥将成时加入百合煮至熟软，加入冰糖调味。',
                            benefit: '润肺止咳，清心安神'
                        },
                        {
                            name: '雪梨炖冰糖',
                            ingredients: '雪梨1个，冰糖适量',
                            method: '雪梨去皮去核，放入碗中，加入冰糖，隔水蒸30分钟即可。',
                            benefit: '滋阴润肺，清热化痰'
                        }
                    ],
                    exercises: [
                        {
                            name: '瑜伽',
                            method: '重点练习阴瑜伽和恢复性瑜伽体式',
                            benefit: '滋阴降火，放松身心',
                            frequency: '每周3-4次'
                        },
                        {
                            name: '冥想',
                            method: '每天静坐冥想15-20分钟，关注呼吸',
                            benefit: '滋阴安神，降低虚火',
                            frequency: '每天1次'
                        },
                        {
                            name: '游泳',
                            method: '中等强度游泳20-30分钟',
                            benefit: '滋阴润燥，凉爽身体',
                            frequency: '每周2-3次'
                        }
                    ],
                    general: [
                        "多吃银耳、百合、芝麻等滋阴食物，少吃辛辣燥热食物",
                        "适合瑜伽、太极等柔缓运动，避免大汗淋漓",
                        "保证充足睡眠，避免熬夜",
                        "可按三阴交、太溪等滋阴穴位"
                    ]
                },
                "痰湿质": {
                    recipes: [
                        {
                            name: '薏米红豆粥',
                            ingredients: '薏米50g，红豆50g',
                            method: '薏米和红豆提前浸泡4小时，放入锅中加水煮至软烂。',
                            benefit: '利水渗湿，健脾消肿'
                        },
                        {
                            name: '冬瓜汤',
                            ingredients: '冬瓜500g，生姜适量',
                            method: '冬瓜去皮切块，生姜切片，一同放入锅中加水煮汤，调味即可。',
                            benefit: '利水消肿，清热化痰'
                        },
                        {
                            name: '陈皮茶',
                            ingredients: '陈皮10g',
                            method: '陈皮洗净，放入杯中，加入开水冲泡，加盖焖10分钟即可饮用。',
                            benefit: '理气健脾，燥湿化痰'
                        }
                    ],
                    exercises: [
                        {
                            name: '快走',
                            method: '每天快走45-60分钟，微微出汗为宜',
                            benefit: '促进新陈代谢，利水消肿',
                            frequency: '每天1次'
                        },
                        {
                            name: '健身操',
                            method: '中等强度有氧操30-45分钟',
                            benefit: '消耗热量，减少痰湿',
                            frequency: '每周4-5次'
                        },
                        {
                            name: '登山',
                            method: '每周登山1-2次，时间60-90分钟',
                            benefit: '增强肺活量，促进排湿',
                            frequency: '每周1-2次'
                        }
                    ],
                    general: [
                        "饮食清淡，多吃薏米、赤小豆、冬瓜等利湿食物",
                        "坚持适度运动，有助于气血运行",
                        "避免居住潮湿环境，多晒太阳",
                        "可按丰隆、中脘等健脾祛湿穴位"
                    ]
                },
                "湿热质": {
                    recipes: [
                        {
                            name: '绿豆汤',
                            ingredients: '绿豆100g，冰糖适量',
                            method: '绿豆洗净，放入锅中加水煮至开花，加入冰糖调味。',
                            benefit: '清热解毒，消暑利水'
                        },
                        {
                            name: '苦瓜炒蛋',
                            ingredients: '苦瓜1根，鸡蛋2个',
                            method: '苦瓜切片用盐腌制后洗净，鸡蛋打散，先炒鸡蛋盛出，再炒苦瓜，最后加入鸡蛋翻炒均匀。',
                            benefit: '清热祛湿，明目解毒'
                        },
                        {
                            name: '荷叶粥',
                            ingredients: '鲜荷叶1张，大米50g',
                            method: '大米煮粥，粥将成时放入洗净的荷叶，再煮5分钟即可。',
                            benefit: '清热解暑，升发清阳'
                        }
                    ],
                    exercises: [
                        {
                            name: '游泳',
                            method: '中等强度游泳30-45分钟',
                            benefit: '清热利湿，凉爽身体',
                            frequency: '每周3-4次'
                        },
                        {
                            name: '羽毛球',
                            method: '中等强度打球45-60分钟',
                            benefit: '出汗排毒，清热利湿',
                            frequency: '每周2-3次'
                        },
                        {
                            name: '瑜伽',
                            method: '练习流瑜伽或热瑜伽，促进排汗',
                            benefit: '调节身心，排除湿热',
                            frequency: '每周3次'
                        }
                    ],
                    general: [
                        "饮食清淡，多吃绿豆、黄瓜、苦瓜等清热利湿食物",
                        "适合大运动量锻炼，如中长跑、游泳等",
                        "避免熬夜和过度劳累",
                        "可按曲池、阴陵泉等清热利湿穴位"
                    ]
                },
                "血瘀质": {
                    recipes: [
                        {
                            name: '山楂红糖水',
                            ingredients: '山楂干20g，红糖适量',
                            method: '山楂干放入锅中加水煮沸，转小火煮15分钟，加入红糖调味。',
                            benefit: '活血化瘀，消食化积'
                        },
                        {
                            name: '黑木耳炒肉片',
                            ingredients: '黑木耳50g，猪肉100g，生姜适量',
                            method: '黑木耳泡发洗净，猪肉切片，热锅爆香姜片，加入肉片翻炒，再加入黑木耳翻炒，调味即可。',
                            benefit: '活血化瘀，滋阴润燥'
                        },
                        {
                            name: '玫瑰花茶',
                            ingredients: '干玫瑰花10g',
                            method: '玫瑰花放入杯中，加入开水冲泡，加盖焖5分钟即可饮用。',
                            benefit: '行气解郁，活血止痛'
                        }
                    ],
                    exercises: [
                        {
                            name: '快走/慢跑',
                            method: '中等强度有氧运动30-45分钟',
                            benefit: '促进血液循环，活血化瘀',
                            frequency: '每周4-5次'
                        },
                        {
                            name: '舞蹈',
                            method: '有氧舞蹈30-45分钟',
                            benefit: '活跃气血，改善循环',
                            frequency: '每周3次'
                        },
                        {
                            name: '按摩',
                            method: '自我按摩或专业按摩，重点按摩血海、三阴交等穴位',
                            benefit: '活血化瘀，疏通经络',
                            frequency: '每周2-3次'
                        }
                    ],
                    general: [
                        "多吃山楂、醋、玫瑰花等活血化瘀食物",
                        "坚持体育锻炼，促进血液循环",
                        "保持心情舒畅，避免恼怒忧郁",
                        "可按血海、内关等活血化瘀穴位"
                    ]
                },
                "气郁质": {
                    recipes: [
                        {
                            name: '菊花薄荷茶',
                            ingredients: '菊花10g，薄荷叶5g',
                            method: '菊花和薄荷叶放入杯中，加入开水冲泡，加盖焖5分钟即可饮用。',
                            benefit: '疏风清热，解郁安神'
                        },
                        {
                            name: '橘皮粥',
                            ingredients: '橘皮10g，大米50g',
                            method: '橘皮洗净切丝，大米煮粥，粥将成时加入橘皮丝，再煮5分钟即可。',
                            benefit: '理气健脾，燥湿化痰'
                        },
                        {
                            name: '香附炖猪肚',
                            ingredients: '香附10g，猪肚1个，生姜适量',
                            method: '猪肚洗净，将香附放入猪肚内，缝合后放入锅中，加入生姜和水炖煮2小时，调味即可。',
                            benefit: '疏肝解郁，理气止痛'
                        }
                    ],
                    exercises: [
                        {
                            name: '户外运动',
                            method: '户外散步、骑行或登山，享受大自然',
                            benefit: '舒畅气机，缓解抑郁',
                            frequency: '每周3-4次'
                        },
                        {
                            name: '瑜伽',
                            method: '重点练习开胸和扭转体式',
                            benefit: '舒展身体，释放情绪',
                            frequency: '每周3次'
                        },
                        {
                            name: '团队运动',
                            method: '参加篮球、足球等团队运动',
                            benefit: '增进社交，缓解孤独感',
                            frequency: '每周1-2次'
                        }
                    ],
                    general: [
                        "多吃萝卜、柑橘、洋葱等行气解郁食物",
                        "多参加集体活动，培养兴趣爱好",
                        "练习瑜伽和冥想有助于放松心情",
                        "可按太冲、膻中等疏肝理气穴位"
                    ]
                },
                "特禀质": {
                    recipes: [
                        {
                            name: '黄芪防风粥',
                            ingredients: '黄芪20g，防风10g，大米50g',
                            method: '黄芪和防风煎水取汁，用汁液煮大米成粥。',
                            benefit: '益气固表，祛风防过敏'
                        },
                        {
                            name: '灵芝红枣茶',
                            ingredients: '灵芝片10g，红枣10颗',
                            method: '灵芝片和红枣放入锅中，加水煮沸后转小火煮20分钟即可饮用。',
                            benefit: '增强免疫力，抗过敏'
                        },
                        {
                            name: '百合银耳羹',
                            ingredients: '百合30g，银耳20g，冰糖适量',
                            method: '银耳泡发撕小朵，百合洗净，一同放入锅中加水煮至软烂，加入冰糖调味。',
                            benefit: '润肺止咳，增强免疫力'
                        }
                    ],
                    exercises: [
                        {
                            name: '室内健身',
                            method: '在空气质量好的室内进行有氧运动',
                            benefit: '避免过敏原，增强免疫力',
                            frequency: '每周3-4次'
                        },
                        {
                            name: '呼吸练习',
                            method: '练习腹式呼吸和深呼吸',
                            benefit: '增强肺功能，减少过敏',
                            frequency: '每天练习'
                        },
                        {
                            name: '温和瑜伽',
                            method: '练习温和的瑜伽体式，避免过度刺激',
                            benefit: '平衡免疫系统，减少过敏',
                            frequency: '每周2-3次'
                        }
                    ],
                    general: [
                        "饮食清淡均衡，少吃辛辣刺激食物",
                        "避免接触过敏原，保持居住环境清洁",
                        "适当锻炼增强免疫力",
                        "可按足三里、肺俞等益气固表穴位"
                    ]
                },
                "平和质": {
                    recipes: [
                        {
                            name: '四神汤',
                            ingredients: '茯苓、淮山、莲子和芡实各20g，猪肚或猪小肠适量',
                            method: '药材洗净，猪肚或小肠处理干净，一同放入锅中加水炖煮2小时，调味即可。',
                            benefit: '健脾养胃，补益安神'
                        },
                        {
                            name: '八宝粥',
                            ingredients: '糯米、黑米、红豆、绿豆、花生、红枣、桂圆、莲子各适量',
                            method: '所有材料洗净，放入锅中加水煮成粥，可加冰糖调味。',
                            benefit: '补益气血，健脾养胃'
                        },
                        {
                            name: '枸杞红枣茶',
                            ingredients: '枸杞15g，红枣10颗',
                            method: '枸杞和红枣放入杯中，加入开水冲泡，加盖焖10分钟即可饮用。',
                            benefit: '补气养血，明目安神'
                        }
                    ],
                    exercises: [
                        {
                            name: '多样化运动',
                            method: '结合有氧运动、力量训练和柔韧性练习',
                            benefit: '全面增强体质，保持平衡',
                            frequency: '每周4-5次'
                        },
                        {
                            name: '户外活动',
                            method: '享受各种户外运动，如骑行、徒步等',
                            benefit: '增强体质，愉悦心情',
                            frequency: '每周2-3次'
                        },
                        {
                            name: '团队运动',
                            method: '参加各种球类运动或团体活动',
                            benefit: '保持社交，增强团队意识',
                            frequency: '每周1-2次'
                        }
                    ],
                    general: [
                        "保持均衡饮食，多吃五谷杂粮和新鲜蔬果",
                        "坚持适度运动，保持身体健康",
                        "保持规律作息，避免过度劳累",
                        "保持心情愉悦，维持良好心态"
                    ]
                }
            };
            
            // 获取当前体质的建议
            const currentSuggestions = constitutionSuggestions[constitution];
            
            // 添加饮食建议
            currentSuggestions.recipes.forEach(recipe => {
                const recipeItem = document.createElement('div');
                recipeItem.className = 'recipe-item';
                recipeItem.innerHTML = `
                    <strong>${recipe.name}</strong><br>
                    食材：${recipe.ingredients}<br>
                    做法：${recipe.method}<br>
                    功效：${recipe.benefit}
                `;
                recipeSuggestions.appendChild(recipeItem);
            });
            
            // 添加运动建议
            currentSuggestions.exercises.forEach(exercise => {
                const exerciseItem = document.createElement('div');
                exerciseItem.className = 'exercise-item';
                exerciseItem.innerHTML = `
                    <strong>${exercise.name}</strong><br>
                    方法：${exercise.method}<br>
                    功效：${exercise.benefit}<br>
                    频率：${exercise.frequency}
                `;
                exerciseSuggestions.appendChild(exerciseItem);
            });
            
            // 添加生活调理建议
            currentSuggestions.general.forEach(suggestion => {
                const li = document.createElement('li');
                li.className = 'general-item';
                li.textContent = suggestion;
                generalSuggestions.appendChild(li);
            });
            
            // 根据心理状态添加额外建议
            if (mentalScores["抑郁倾向"] > 5) {
                const li1 = document.createElement('li');
                li1.className = 'general-item';
                li1.textContent = "每天进行15分钟的阳光浴，有助于改善情绪";
                generalSuggestions.appendChild(li1);
                
                const li2 = document.createElement('li');
                li2.className = 'general-item';
                li2.textContent = "尝试写感恩日记，每天记录三件让自己感到开心的事";
                generalSuggestions.appendChild(li2);
            }
            
            if (mentalScores["焦虑倾向"] > 5) {
                const li1 = document.createElement('li');
                li1.className = 'general-item';
                li1.textContent = "练习腹式呼吸和正念冥想，每天10分钟";
                generalSuggestions.appendChild(li1);
                
                const li2 = document.createElement('li');
                li2.className = 'general-item';
                li2.textContent = "减少咖啡因摄入，尤其是在下午和晚上";
                generalSuggestions.appendChild(li2);
            }
            
            if (mentalScores["睡眠质量"] > 3) {
                const li1 = document.createElement('li');
                li1.className = 'general-item';
                li1.textContent = "建立规律的睡眠时间表，尽量每天同一时间睡觉和起床";
                generalSuggestions.appendChild(li1);
                
                const li2 = document.createElement('li');
                li2.className = 'general-item';
                li2.textContent = "睡前1小时避免使用电子设备，可以改为阅读纸质书";
                generalSuggestions.appendChild(li2);
            }
            
            if (mentalScores["压力水平"] > 6) {
                const li1 = document.createElement('li');
                li1.className = 'general-item';
                li1.textContent = "尝试时间管理技巧，如番茄工作法，减少压力来源";
                generalSuggestions.appendChild(li1);
                
                const li2 = document.createElement('li');
                li2.className = 'general-item';
                li2.textContent = "每周安排至少2次30分钟以上的有氧运动";
                generalSuggestions.appendChild(li2);
            }
        }

        // 初始化问卷
        initQuestionnaire();
    </script>
</body>
</html>
