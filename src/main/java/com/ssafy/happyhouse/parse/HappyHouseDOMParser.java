package com.ssafy.happyhouse.parse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class HappyHouseDOMParser implements HappyHouseParser {
    private List<HappyHouseDTO> list;

    public HappyHouseDOMParser() {
        list = new ArrayList<>();
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        try {
            DocumentBuilder builder = factory.newDocumentBuilder();

            // parse 를 하면 이미 문서 읽기 종료!!!!
            Document doc = builder.parse(HappyHouseDTO.class.getResourceAsStream(FILE_TYPE4)); // 실행 전 원하는 타입 번호로 변경할 것

            // root element 확인해볼까요..
            Element root = doc.getDocumentElement();
            // System.out.println(root);

            // NameSpace: 이름 공간
            // XML은 태그 이름을 만들고 싶은대로 만들 수 있다.
            // 태그의 이름이 충돌하는 것을 방지하기 위해 패키지 이름처럼 사용 가능
            NodeList nodes = root.getElementsByTagName("item");
            for (int i = 0; i < nodes.getLength(); i++) {
                HappyHouseDTO happyhouse = new HappyHouseDTO();
                Node infoNode = nodes.item(i);
                // 속성 가져오기.
                //NamedNodeMap attrs = infoNode.getAttributes();
                // System.out.println(child+" : "+attrs.getNamedItem("주민번호").getNodeValue());
                //addr.setSsn(attrs.getNamedItem("주민번호").getNodeValue());
                // 자식 노드 찾아보기
                NodeList childs = infoNode.getChildNodes();
                for (int j = 0; j < childs.getLength(); j++) {
                    Node child = childs.item(j);
                    String nodeName = child.getNodeName();
                    String nodeValue = child.getTextContent();
                    //System.out.println(nodeName+" : "+nodeValue);
                    
                    // 실행 전 원하는 타입으로 변경할 것
                    happyhouse.setType("4");
                    happyhouse.setRentAmount("0"); // default value로 초기화
                    
                    switch(nodeName) {
                    case "법정동":
                    	happyhouse.setDong(nodeValue);
                    	break;
                    case "아파트":
                    case "연립다세대":
                    	happyhouse.setName(nodeValue);
                    	break;
                    case "지역코드":
                    	happyhouse.setRegionCode(nodeValue);
                    	break;
                    case "거래금액":
                    case "보증금액":
                    	happyhouse.setDealAmount(nodeValue);
                    	break;
                    case "월세금액":
                    	happyhouse.setRentAmount(nodeValue);
                    	break;
                    case "건축년도":
                    	happyhouse.setBuildYear(nodeValue);
                    	break;
                    case "년":
                    	happyhouse.setDealYear(nodeValue);
                    	break;
                    case "월":
                    	happyhouse.setDealMonth(nodeValue);
                    	break;
                    case "일":
                    	happyhouse.setDealDay(nodeValue);
                    	break;
                    case "전용면적":
                    	happyhouse.setArea(nodeValue);
                    	break;
                    case "층":
                    	happyhouse.setFloor(nodeValue);
                    	break;
                    case "지번":
                    	happyhouse.setJibun(nodeValue);
                    	break;
                    }
                }
                //System.out.println(happyhouse.toString());
                list.add(happyhouse);
            }
        } catch (ParserConfigurationException | SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

	@Override
	public List<HappyHouseDTO> getData() {
		return list;
	}


}
