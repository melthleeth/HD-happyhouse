package com.ssafy.happyhouse.view;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.Image;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.happyhouse.model.service.HouseServiceImpl;
import com.ssafy.happyhouse.model.dto.Store;


public class HouseInfoView{
	
	/**model들 */
	private HouseService 		houseService;
	
	/** main 화면 */
	private JFrame frame;
	
	/** 주택 목록 화면*/
	// JFrame owner;
	

	/**창 닫기 버튼*/
	//private JButton  closeBt;
	
	/**주택 이미지 표시 Panel*/
	private JLabel	 			imgL;
	private JLabel[] 			houseInfoL;
	
	/**조회 조건*/
	private JCheckBox[]		  	chooseC;
	private JComboBox<String> 	findC; 
	private JTextField		  	wordTf;
	private JButton			  	searchBt;
	
	/**조회 내용 표시할 table*/
	private DefaultTableModel 	houseModel;
	private JTable			  	houseTable;
	private JScrollPane		  	housePan;
	private String[]		  	title = { "번호", "동", "아파트이름", "거래금액", "거래종류" };
	
	/**검색  조건*/
	private String	key;
	
	/**검색할 단어*/
	private String  word;
	private boolean[] searchType = { true, true, true, true };
	private String[] choice = { "all", "dong", "name" };
	
	/**화면에 표시하고 있는 주택*/
	private HouseDeal curHouse;
	
	/** 추가기능 */
	static String area;
	
	/** Sorting Flag */
	boolean asc = false;
	boolean desc = false;
	boolean dong = false;
	boolean apt = false;

	
	private void showHouseInfo(int code) {
		
		curHouse = houseService.search(code);
		System.out.println(curHouse);
		
		
		//foodInfoL[0].setText(""+curfood.getCode());
		houseInfoL[0].setText("");
		houseInfoL[1].setText("");
		houseInfoL[2].setText(curHouse.getAptName());
		houseInfoL[3].setText(""+curHouse.getDealAmount());
		String rent = curHouse.getRentMoney();
		if(rent == null) {
			houseInfoL[4].setText("없음");
		}else {
			houseInfoL[4].setText(curHouse.getRentMoney());
		}
		houseInfoL[5].setText(""+curHouse.getBuildYear());
		houseInfoL[6].setText(curHouse.getArea()+"");
		houseInfoL[7].setText(String.format("%d년 %d월 %d일"
											,curHouse.getDealYear()
											,curHouse.getDealMonth()
											,curHouse.getDealDay()
											));
		houseInfoL[8].setText(curHouse.getDong());
		houseInfoL[9].setText(curHouse.getJibun());
		area = curHouse.getDong();
		
		ImageIcon icon = new ImageIcon("img/다세대주택.jpg");
		if(new File("img/" + curHouse.getAptName() + ".jpg").exists()) {
			icon = new ImageIcon("img/" + curHouse.getAptName() + ".jpg");
		}

		imgL.setIcon(icon);
		  
		
	}
	
	public HouseInfoView(){
		/*Service들 생성 */
		houseService = new HouseServiceImpl();
		
		/*메인 화면 설정 */
		frame = new JFrame("HappyHouse -- 아파트 거래 정보");
//		frame.addWindowListener(new WindowAdapter() {
//			public void windowClosing(WindowEvent e){
//				frame.dispose();
//			}
//		});
		
		setMain();
		
		frame.setSize(1200, 800);
		frame.setResizable(true);
		frame.setVisible(true);
		showHouseInfo(1);
		//showHouses();
	}

	/**메인 화면인 주택 목록을 위한 화면 셋팅하는 메서드  */
	public void setMain(){
		
		/*왼쪽 화면을 위한 설정 */
		JPanel left = new JPanel(new BorderLayout());
		JPanel leftCenter = new JPanel(new GridLayout(1, 2));
		JPanel leftR = new JPanel(new GridLayout(10, 2));
		JPanel leftL = new JPanel(new GridLayout(2, 1));
		JPanel leftLB = new JPanel(new GridLayout(1, 2));
		leftR.setBorder(BorderFactory.createEmptyBorder(0 , 10 , 10 , 10));
		
		String[] info= {"","","주택명","거래금액","월세금액","건축연도","전용면적","거래일","법정동","지번"};
		int size = info.length;
		JLabel infoL[] = new JLabel[size];
		houseInfoL = new JLabel[size];
		for (int i = 0; i <size; i++) {
			infoL[i] = new JLabel(info[i]);
			houseInfoL[i]=new JLabel("");
			leftR.add(infoL[i]);
			leftR.add(houseInfoL[i]);
		}
		imgL = new JLabel();
		leftL.add(imgL);
		
		/* 새창띄우기1 */
        JButton OpenWindow1 = new JButton("주변 환경 오염 분석");    
        OpenWindow1.addActionListener(new ActionListener() {
            // 만들어진 버튼 "새 창 띄우기"에 버튼이 눌러지면 발생하는 행동을 정의
            @Override
            public void actionPerformed(ActionEvent e) {
                // TODO Auto-generated method stub
                new newWindow1(); // 클래스 newWindow를 새로 만들어낸다
            }            
        });
        OpenWindow1.setPreferredSize(new Dimension(150, 20));
        leftLB.add(OpenWindow1);
        
        /* 새창띄우기2 */
        JButton OpenWindow2 = new JButton("주변 상가 정보 분석");    
        OpenWindow2.addActionListener(new ActionListener() {
            // 만들어진 버튼 "새 창 띄우기"에 버튼이 눌러지면 발생하는 행동을 정의
            @Override
            public void actionPerformed(ActionEvent e) {
                // TODO Auto-generated method stub
                try {
					new newWindow2();
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} // 클래스 newWindow를 새로 만들어낸다
            }            
        });
        OpenWindow2.setPreferredSize(new Dimension(150, 20));
        leftLB.add(OpenWindow2);
        leftL.add(leftLB);
		
		
		
		leftCenter.add(leftL);
		leftCenter.add(leftR);
		
		left.add(new JLabel("아파트 거래 정보", JLabel.CENTER),"North");
		left.add(leftCenter,"Center");
		
		
		/*오른쪽 화면을 위한 설정 */
		JPanel right = new JPanel(new BorderLayout());
		JPanel rightTop = new JPanel(new GridLayout(3, 3));
		JPanel rightTop1 = new JPanel(new GridLayout(1, 4));
		
		String[] chooseMeg= { "아파트 매매", "아파트 전월세", "주택 매매", "주택 전월세"};
		chooseC = new JCheckBox[chooseMeg.length];
		for (int i = 0, len= chooseMeg.length; i < len; i++) {
			chooseC[i] = new JCheckBox(chooseMeg[i], true);
			rightTop1.add(chooseC[i]);
		}
		
		
		JPanel rightTop2 = new JPanel(new GridLayout(1, 3));
		String[] item = {"---all---","동","아파트 이름"}; 
		findC = new JComboBox<String>(item);
		wordTf = new JTextField();
		searchBt = new JButton("검색");
		
		rightTop2.add(findC);
		rightTop2.add(wordTf);
		rightTop2.add(searchBt);
		
		
		JPanel rightTop3 = new JPanel(new GridLayout (1, 4));
        JButton btn_sortPrice_asc = new JButton("오름차순");
        btn_sortPrice_asc.setBackground(Color.decode("#FA8072"));
        //btn_sortPrice_asc.setBorder(new LineBorder(Color.decode("#FA8072"), 1));
        JButton btn_sortPrice_desc = new JButton("내림차순");
        btn_sortPrice_desc.setBackground(Color.decode(("#00CED1")));
        //btn_sortPrice_desc.setBorder(new LineBorder(Color.decode("#00CED1"), 1));
        JButton btn_sortDong = new JButton("동 이름순");
        btn_sortDong.setBackground(Color.decode(("#ADFF2F")));
        JButton btn_sortAptName = new JButton("아파트 이름순");
        btn_sortAptName.setBackground(Color.decode(("#F5DEB3")));
        
        //rightTop3.add(new Label("sort by price"));
        rightTop3.add(btn_sortPrice_asc);
        rightTop3.add(btn_sortPrice_desc);
        rightTop3.add(btn_sortDong);
        rightTop3.add(btn_sortAptName);
        
        //rightTop.add(new Label("select"));
        rightTop.add(rightTop1);
        //rightTop.add(new Label("apt name or dong name"));
        rightTop.add(rightTop2);        
        //rightTop.add(new Label("sorting"));
        rightTop.add(rightTop3);   
		
		
		JPanel rightCenter = new JPanel(new BorderLayout());
		houseModel = new DefaultTableModel(title,20);
		houseTable = new JTable(houseModel);
		housePan = new JScrollPane(houseTable);
		houseTable.setColumnSelectionAllowed(true);
		rightCenter.add(new JLabel("거래 내역", JLabel.CENTER),"North");
		rightCenter.add(housePan,"Center");
		
		right.add(rightTop,"North");
		right.add(rightCenter,"Center");
		

		
		
		JPanel mainP = new JPanel(new GridLayout(1, 2));
		
		mainP.add(left);
		mainP.add(right);
		
		mainP.setBorder(BorderFactory.createEmptyBorder(20 , 10 , 10 , 10));
		frame.add(mainP,"Center");
		
		/*이벤트 연결*/

		houseTable.addMouseListener( new MouseAdapter() {
			@Override
			public void mouseReleased(MouseEvent e) {
				int row =  houseTable.getSelectedRow();
				System.out.println("선택된 row : " + row);
				System.out.println("선택된 row의 column 값 :"+houseModel.getValueAt(row, 0));
				int code = Integer.parseInt(((String)houseModel.getValueAt(row, 0)).trim());
				showHouseInfo(code);
			}
		});
		
		// complete code #01
		// 아래의 코드를 참조하여 아래 라인을 uncomment 하고 searchBt.addActionList() 를 Lambda 표현식으로 바꾸세요.
		// searchBt.addActionListener( /* 여기 */ );
		
		// 참조코드 시작 - 위 코드를 완성 후 삭제 또는 comment 처리하세요.
		/*
		ActionListener buttonHandler = new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				searchHouses();
			}
		};
		
		searchBt.addActionListener( buttonHandler );
		*/
		// 참조코드 종료
		
		searchBt.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				searchHouses();
			}
		});		
		showHouses();
		
		
		btn_sortPrice_asc.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				asc = true;
				desc = false;
				apt = false;
				dong = false;
				searchHouses();
			}
		});
		btn_sortPrice_desc.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				asc = false;
				desc = true;
				dong = false;
				apt = false;
				searchHouses();
			}
		});
		
		btn_sortDong.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				asc = false;
				desc = false;
				dong = true;
				apt = false;
				searchHouses();
			}
		});

		btn_sortAptName.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				asc = false;
				desc = false;
				dong = false;
				apt = true;
				searchHouses();
			}
		});
	}
	
	
	/**검색 조건에 맞는 주택 정보 검색 */
	private void searchHouses() {
		System.out.println("!! 검색을 시작합니다.");
		for(int i = 0, size = chooseC.length; i<size; i++) {
			if(chooseC[i].isSelected()) {
				searchType[i] = true;
			}else {
				searchType[i] = false;
			}
		}
		System.out.println("searchType : " + Arrays.toString(searchType));
		word = wordTf.getText().trim();
		key = choice[findC.getSelectedIndex()];
		System.out.println("word:"+word+" key:"+key);
		showHouses();		
	}
	/**
	 * 주택 목록을  갱신하기 위한 메서드 
	 */
	public void showHouses(){
		HousePageBean  bean = new HousePageBean();
		bean.setSearchType(searchType);
		if(key !=null) {
			if(key.equals("dong")) {
				bean.setDong(word);
			}else if(key.equals("name")) {
				bean.setAptname(word);
			}
		}
		
		System.out.println("bean = "+bean);
		List<HouseDeal> deals = houseService.searchAll(bean);
		
		
		
		if(asc==true) {
			
			Collections.sort(deals, new Comparator<HouseDeal>() {
				@Override
				public int compare(HouseDeal o1, HouseDeal o2) {
					// TODO Auto-generated method stub
					String temp1 = o1.getDealAmount().replaceAll(",", "").replaceAll(" ", "");
					String temp2 = o2.getDealAmount().replaceAll(",", "").replaceAll(" ", "");
					return Integer.compare(Integer.parseInt(temp1), Integer.parseInt(temp2));
				}
				
			});
//			MergeSort sort = new MergeSort();
//			deals = sort.mergeSort(deals);
		}
		else if(desc==true) {
			Collections.sort(deals, new Comparator<HouseDeal>() {
				@Override
				public int compare(HouseDeal o1, HouseDeal o2) {
					// TODO Auto-generated method stub
					String temp1 = o1.getDealAmount().replaceAll(",", "").replaceAll(" ", "");
					String temp2 = o2.getDealAmount().replaceAll(",", "").replaceAll(" ", "");
					return Integer.compare(Integer.parseInt(temp2), Integer.parseInt(temp1));
				}
				
			});
//			QuickSort sort = new QuickSort();
//			deals = sort.quickSort(deals);
		}else if(dong == true) {
			
			Collections.sort(deals, new Comparator<HouseDeal>() {

				@Override
				public int compare(HouseDeal o1, HouseDeal o2) {
					// TODO Auto-generated method stub
					return o1.getDong().compareTo(o2.getDong());
					
				}
				
			});
//			BubbleSort sort = new BubbleSort();
//			deals = sort.bubbleSort(deals);
		}else if (apt==true) {
			Collections.sort(deals, new Comparator<HouseDeal>() {

				@Override
				public int compare(HouseDeal o1, HouseDeal o2) {
					// TODO Auto-generated method stub
					return o1.getAptName().compareTo(o2.getAptName());
				}
				
			});
		}
		
		
		if(deals!=null){
			int i=0;
			String[][]data = new String[deals.size()][5];
			for (HouseDeal deal: deals) {
				data[i][0]= ""+deal.getNo();
				data[i][1]= deal.getDong();
				data[i][2]= deal.getAptName();
				data[i][3]= deal.getDealAmount();
				data[i++][4]= deal.getType();
			}
			houseModel.setDataVector(data, title);
		}
	}
//	public static void main(String[] args) {
//		new HouseInfoView();
//	}
	
}


class newWindow1 extends JFrame {
    // 버튼이 눌러지면 만들어지는 새 창을 정의한 클래스
	
	newWindow1() {
    	
        setTitle("주변 환경 오염 분석");
        // 주의, 여기서 setDefaultCloseOperation() 정의를 하지 말아야 한다
        // 정의하게 되면 새 창을 닫으면 모든 창과 프로그램이 동시에 꺼진다
        
        JPanel NewWindowContainer = new JPanel();
        setContentPane(NewWindowContainer);
        JLabel NewLabel = new JLabel(HouseInfoView.area + "에 오신것을 환영합니다.");
        
        NewWindowContainer.add(NewLabel);
        
        setSize(1000,100);
        setResizable(false);
        setVisible(true);
    }
}

class newWindow2 extends JFrame {
    // 버튼이 눌러지면 만들어지는 새 창을 정의한 클래스
	
	newWindow2() throws Exception {
		List<Store> stores = new ArrayList<Store>();
		setTitle("주변 상가 정보 분석");
		String header [] = {"Name", "Category", "Subclass", "Address"};
		String contents [][];
		
		DefaultTableModel 	storeModel;
		JTable			  	storeTable;
		JScrollPane			storePan;
		
		String csvFileName = "res/상가정보_샘플.csv";
		try (BufferedReader br = new BufferedReader(new FileReader(csvFileName))) {
		    String line;

		    while ((line = br.readLine()) != null) {
		    	String[] values = line.split("\\|");
		    	// idx = 1, 4, 8, 18
		    	Store store = new Store(values[1],values[4],values[8],values[24]);
		    	if(HouseInfoView.area.equals(values[18])) {
		    		stores.add(store);
		    	}
		    }
		    contents = new String[stores.size()][4];
		    for(int i=0; i<stores.size(); i++) {
		    	contents[i][0] = stores.get(i).getName();
		    	contents[i][1] = stores.get(i).getCategory();
		    	contents[i][2] = stores.get(i).getSubclass();
		    	contents[i][3] = stores.get(i).getArea();
			}
		}
		
		
        
        // 주의, 여기서 setDefaultCloseOperation() 정의를 하지 말아야 한다
        // 정의하게 되면 새 창을 닫으면 모든 창과 프로그램이 동시에 꺼진다
        
        JPanel NewWindowContainer = new JPanel();
        setContentPane(NewWindowContainer);
        JTable table = new JTable(contents, header);
        //JScrollPane scrollpane = new JScrollPane(table);
        
        JPanel TableCenter = new JPanel(new BorderLayout());
        storeModel = new DefaultTableModel(header,20);
        storeTable = new JTable(storeModel);
		storePan = new JScrollPane(storeTable);
		storeTable.setColumnSelectionAllowed(true);
		storeModel.setDataVector(contents, header);
        
		
		TableCenter.add(new JLabel(HouseInfoView.area+"의 주변 상가 정보 분석", JLabel.CENTER),"North");
		TableCenter.add(storePan,"Center");
		
		
		
		
        NewWindowContainer.add(TableCenter, "Center");
        //setBounds(300,300,300,200);
        setSize(800,500);
        //setResizable(false);
        setVisible(true);
    }
}

class MergeSort {
    public List<HouseDeal> mergeSort(final List<HouseDeal> input){
        if(input.size() < 2)
            return input;
        
        final List<HouseDeal> leftHalf = input.subList(0, input.size()/2); // 왼쪽 절반 
        final List<HouseDeal> rightHalf = input.subList(input.size()/2, input.size()); // 오른쪽 절반 
        
        return merge(mergeSort(leftHalf), mergeSort(rightHalf));
    }
    
    // 병합 
    private List<HouseDeal> merge(final List<HouseDeal> left, final List<HouseDeal> right){
        int leftPtr = 0;
        int rightPtr = 0;
        
        final List<HouseDeal> mergedList = new ArrayList<>(left.size() + right.size());
        
        while(leftPtr < left.size() && rightPtr < right.size()) {
        	String temp1 = left.get(leftPtr).getDealAmount().replaceAll(",", "").replaceAll(" ", "");
			String temp2 = right.get(rightPtr).getDealAmount().replaceAll(",", "").replaceAll(" ", "");
            if(Integer.parseInt(temp1) < Integer.parseInt(temp2)) {
                mergedList.add(left.get(leftPtr));
                leftPtr++;
            }else {
                mergedList.add(right.get(rightPtr));
                rightPtr++;
            }
        }
        // 나머지 데이터 삽입
        while(leftPtr < left.size()) {
            mergedList.add(left.get(leftPtr));
            leftPtr++;
        }
        
        while(rightPtr < right.size()) {
            mergedList.add(right.get(rightPtr));
            rightPtr++;
        }
        
        return mergedList;
    }
}

class QuickSort{
	public List<HouseDeal> quickSort(List<HouseDeal> numbers){
	    if(numbers.size() < 2)
	        return numbers;
	    
	    final HouseDeal pivot = numbers.get(0);
	    final List<HouseDeal> lower = new ArrayList<>();
	    final List<HouseDeal> higher = new ArrayList<>();
	    
	    
	    for(int i=1; i<numbers.size(); i++) {
	        if(Integer.parseInt(numbers.get(i).getDealAmount().replaceAll(",", "").replaceAll(" ", "")) > Integer.parseInt(pivot.getDealAmount().replaceAll(",", "").replaceAll(" ", ""))) {
	            lower.add(numbers.get(i));
	        }else {
	            higher.add(numbers.get(i));
	        }
	    }
	    
	    final List<HouseDeal> sorted = quickSort(lower);
	    sorted.add(pivot);
	    sorted.addAll(quickSort(higher));
	    
	    return sorted;
	}
}

class BubbleSort{
	
	public List<HouseDeal> bubbleSort(List<HouseDeal> array) {
		System.out.println("들어왔습니다.");
	    int size = array.size();
	     
	    for(int i=0; i < size-1; i++) {
	        for(int j=0; j < size-1-i; j++) {
	        	System.out.println(array.get(j).getDong() + " " + array.get(j+1).getDong());
	        	System.out.println(array.get(j).getDong().compareTo(array.get(j+1).getDong()));
	        	System.out.println();
	            if(array.get(j).getDong().replaceAll(" ", "").compareTo(array.get(j+1).getDong().replaceAll(" ", ""))==1) {
	                HouseDeal temp = array.get(j);
	        		HouseDeal temp2 = array.get(j+1);
	        		array.set(j, temp2);
	        		array.set(j+1, temp);
	            }
	        }
	    }
	    return array;
	}
}

class SelectionSort{
	 // 선택정렬 
	public List<HouseDeal> bubbleSort(List<HouseDeal> array) {
        int size = array.size();
        int i, j, min;
        
        for(i = 0; i < size-1; i++) {
            min = i;
            for(j = i+1; j < size; j++) {
            	if(array.get(j).getAptName().replaceAll(" ", "").compareTo(array.get(j+1).getAptName().replaceAll(" ", ""))==1) {
                    min = j;
                }
            }
            HouseDeal temp = array.get(min);
    		HouseDeal temp2 = array.get(i);
    		array.set(min, temp2);
    		array.set(i, temp);

        }
        return array;
    }
    
    
}