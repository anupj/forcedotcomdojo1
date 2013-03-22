public with sharing class RomanNumeralCalculator {

    public Map<String, Integer> numeralsMap = new Map<String, Integer>();    
    public String leftProperty {get; set;}
    public String rightProperty {get; set;}
    public String selectedOperator {get; set;}
    public Integer result {get; set;}
    public Integer intLeft {get; set;}
    public List<SelectOption> operatorList {
        get {
            return operatorList();
        }
    }
    
    public List<SelectOption> operatorList() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('*','*'));
        options.add(new SelectOption('/','/'));
        options.add(new SelectOption('+','+'));
        options.add(new SelectOption('-','-'));
        return options;
    } 
  
    // constructor
    public RomanNumeralCalculator() {
        numeralsMap.put('I', 1);
        numeralsMap.put('V', 5);
        numeralsMap.put('X', 10);
        numeralsMap.put('L', 50);
        numeralsMap.put('C', 100);
        numeralsMap.put('D', 500);
        numeralsMap.put('M', 1000);
        intLeft = translateRomanToInt('MDCXLII');
    }
    
    public PageReference calculate() {
        Integer leftPropInt = 0;
        Integer rightPropInt = 0;
        result = 0;
        // if the string length is 1
        if(leftProperty.length() == 1) {
            leftPropInt = numeralsMap.get(leftProperty);
        }
        else {
            leftPropInt = translateRomanToInt(leftProperty);
        }
        if(rightProperty.length() == 1) {
            rightPropInt = numeralsMap.get(rightProperty);
        }
        else {
           rightPropInt = translateRomanToInt(rightProperty);
        }
        result = operate(leftPropInt, rightPropInt);
        
        return null;
    }
    
    public Integer operate(Integer left, Integer right) {
        if(selectedOperator == '*' ) {
            return left * right;
        }
        if(selectedOperator == '/' ) {
            return left / right;
        }
        if(selectedOperator == '+' ) {
            return left + right;
        }
        if(selectedOperator == '-' ) {
            return left - right;
        }
        return null;
    }
    
    private String translateIntToRoman (Integer intTotranslate) {
        
        return '';
    }
    
     private Integer translateRomanToInt (String stringTotranslate) {
        Integer length = stringTotranslate.length();
        Integer operResult = 0;
        
        /*List<Integer> propListA = new Integer[length;
        List<Integer> propListB = new List<Integer>();
        Integer res = 0;
        for (Integer i = 0; i < length ; i++) {
            propListA.add();
        }*/
        
        Integer integerChar = 0;
        String stringChar = '';
        Integer integerNextChar = 0;
        String stringNextChar = '';
        Integer substract = 0;
        Boolean flag = false;
        for (Integer i = 0; i< length; i++)
        {
            if(!flag) {
                substract = 0;
            }
            
            
            
            stringChar = stringTotranslate.substring(i, i+1);
            integerChar = numeralsMap.get(stringChar);
            //integerChar -= substract;
            
            if (i == (length -1)) {
                operResult += integerChar;
            }
            else {
                stringNextChar = stringTotranslate.substring(i+1, i+2);
                integerNextChar = numeralsMap.get(stringNextChar);
                
                if (integerChar < integerNextChar) {
                    operResult -= integerChar;
                } else {
                    operResult += integerChar;
                }
                
            }
            
            
        }
        intLeft = operResult;
        return operResult;
    }
}