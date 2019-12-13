package edu.jwj439.stats.utils;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.imageio.ImageIO;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import edu.jwj439.bus.entity.Order;

public class ExprotOrderUtil {

    public static ByteArrayOutputStream exportOrder(Order order, String sheetName) {


        SimpleDateFormat sdf = (SimpleDateFormat) DateFormat.getDateTimeInstance();
        // 一、组装excel文档
        // 1.创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 2.创建样式
        HSSFCellStyle baseStyle = ExportHSSFCellStyle.createBaseStyle(workbook);
        HSSFCellStyle titleStyle = ExportHSSFCellStyle.createTitleStyle(workbook);
        // 3.创建工作簿
        HSSFSheet sheet = workbook.createSheet(sheetName);
        // 4.设置sheet
        sheet.setDefaultColumnWidth(25);
        // 5.合并
        CellRangeAddress region1 = new CellRangeAddress(0, 0, 0, 3);
        sheet.addMergedRegion(region1);
        // 6.第一行
        int index = 0;
        HSSFRow row1 = sheet.createRow(index);
        // 6.1
        HSSFCell row1_cell = row1.createCell(0);
        row1_cell.setCellStyle(titleStyle);
        row1_cell.setCellValue(order.getOrderCustName() + "客户订单信息");

        // 7 第二行
        index++;
        HSSFRow row2 = sheet.createRow(index);
        // 7.1设置行高
        row2.setHeightInPoints(150);

        HSSFCell row2_cell1 = row2.createCell(0);
        row2_cell1.setCellStyle(baseStyle);
        row2_cell1.setCellValue("订单编号:");

        HSSFCell row2_cell2 = row2.createCell(1);
        row2_cell2.setCellStyle(baseStyle);
        row2_cell2.setCellValue(order.getOrderNumber());

        HSSFCell row2_cell3 = row2.createCell(2);
        row2_cell3.setCellStyle(baseStyle);
        row2_cell3.setCellValue("二维码:");

        HSSFCell row2_cell4 = row2.createCell(3);
        row2_cell4.setCellStyle(baseStyle);
        row2_cell4.setCellValue("");

        // 画图片
        InputStream logoStream =
                ExprotCustomerUtil.class.getClassLoader().getResourceAsStream("logo.jpg");
        BufferedImage image = ZXingCodeEncodeUtil.createZxingCodeUseLogo(order.getOrderNumber(),
                150, 150, logoStream);

        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        try {
            ImageIO.write(image, "JPEG", bos);
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        // 画图的顶级管理器，一个sheet只能获取一个（一定要注意这点）
        HSSFPatriarch patriarch = sheet.createDrawingPatriarch();

        /**
         * 参数4 设置图片的平铺程度 最大值是255 255代表铺满当前单元格 小于255就铺不满 参数5 列的开始坐标 参数6 行的开始坐标 参数7 列的结束坐标 参数8 行的结束坐标
         */
        HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0, 0, 255, (short) 3, 1, (short) 4, 1);
        anchor.setAnchorType(HSSFClientAnchor.AnchorType.DONT_MOVE_AND_RESIZE);
        patriarch.createPicture(anchor,
                workbook.addPicture(bos.toByteArray(), HSSFWorkbook.PICTURE_TYPE_JPEG));

        // 第三行
        index++;
        HSSFRow row3 = sheet.createRow(index);

        HSSFCell row3_cell1 = row3.createCell(0);
        row3_cell1.setCellStyle(baseStyle);
        row3_cell1.setCellValue("客户姓名:");

        HSSFCell row3_cell2 = row3.createCell(1);
        row3_cell2.setCellStyle(baseStyle);
        row3_cell2.setCellValue(order.getOrderCustName());

        HSSFCell row3_cell3 = row3.createCell(2);
        row3_cell3.setCellStyle(baseStyle);
        row3_cell3.setCellValue("宽带业务:");

        HSSFCell row3_cell4 = row3.createCell(3);
        row3_cell4.setCellStyle(baseStyle);
        row3_cell4.setCellValue(order.getOrderBandwidth());

        // 第四行
        index++;
        HSSFRow row4 = sheet.createRow(index);

        HSSFCell row4_cell1 = row4.createCell(0);
        row4_cell1.setCellStyle(baseStyle);
        row4_cell1.setCellValue("起始时间:");

        HSSFCell row4_cell2 = row4.createCell(1);
        row4_cell2.setCellStyle(baseStyle);
        row4_cell2.setCellValue(sdf.format(order.getOrderCreatetime()));

        HSSFCell row4_cell3 = row4.createCell(2);
        row4_cell3.setCellStyle(baseStyle);
        row4_cell3.setCellValue("到期时间:");

        HSSFCell row4_cell4 = row4.createCell(3);
        row4_cell4.setCellStyle(baseStyle);
        row4_cell4.setCellValue(sdf.format(order.getOrderEndtime()));

        // 第五行
        index++;
        HSSFRow row5 = sheet.createRow(index);

        HSSFCell row5_cell1 = row5.createCell(0);
        row5_cell1.setCellStyle(baseStyle);
        row5_cell1.setCellValue("付费类型:");

        HSSFCell row5_cell2 = row5.createCell(1);
        row5_cell2.setCellStyle(baseStyle);
        switch (order.getOrderFeetype()) {
            case 1:
                row5_cell2.setCellValue("租约包年");
                break;
            case 0:
                row5_cell2.setCellValue("租约包月");
                break;
            default:
                row5_cell2.setCellValue("请填写");
                break;
        }

        HSSFCell row5_cell3 = row5.createCell(2);
        row5_cell3.setCellStyle(baseStyle);
        row5_cell3.setCellValue("租约价格:");

        HSSFCell row5_cell4 = row5.createCell(3);
        row5_cell4.setCellStyle(baseStyle);
        row5_cell4.setCellValue(order.getOrderPay());

        // 第六行 -空行
        index++;

        // 第七行
        index++;
        HSSFRow row7 = sheet.createRow(index);
        HSSFCell row7_cell3 = row7.createCell(2);
        row7_cell3.setCellStyle(baseStyle);
        row7_cell3.setCellValue("打印时间:");

        HSSFCell row7_cell4 = row7.createCell(3);
        row7_cell4.setCellStyle(baseStyle);
        row7_cell4.setCellValue(sdf.format(new Date()));

        // 第八行
        index++;
        HSSFRow row8 = sheet.createRow(index);
        HSSFCell row8_cell3 = row8.createCell(2);
        row8_cell3.setCellStyle(baseStyle);
        row8_cell3.setCellValue("操作员:");

        HSSFCell row8_cell4 = row8.createCell(3);
        row8_cell4.setCellStyle(baseStyle);
        row8_cell4.setCellValue(order.getOrderOperator());

        // 第九行
        index++;
        HSSFRow row9 = sheet.createRow(index);
        HSSFCell row9_cell3 = row9.createCell(2);
        row9_cell3.setCellStyle(baseStyle);
        row9_cell3.setCellValue("客户签名:");

        // 到此execl组装完成
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        // 把workbook里面的数据写到outputStream
        try {
            workbook.write(outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return outputStream;

    }
}
