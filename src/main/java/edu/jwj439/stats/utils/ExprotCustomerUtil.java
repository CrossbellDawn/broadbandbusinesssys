package edu.jwj439.stats.utils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import edu.jwj439.bus.entity.Customer;

public class ExprotCustomerUtil {
    /**
     * 导出客户数据
     * 
     * @param customers
     * @param fileName
     * @param sheetName
     * @param response
     * @return
     */
    @SuppressWarnings("deprecation")
    public static ByteArrayOutputStream exportCustomer(List<Customer> customers, String sheetName) {
        // 一组装excel文档
        // 1,创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 2,创建样式
        HSSFCellStyle baseStyle = ExportHSSFCellStyle.createBaseStyle(workbook);
        HSSFCellStyle subTitleStyle = ExportHSSFCellStyle.createSubTitleStyle(workbook);
        HSSFCellStyle tableTitleStyle = ExportHSSFCellStyle.createTableTitleStyle(workbook);
        HSSFCellStyle titleStyle = ExportHSSFCellStyle.createTitleStyle(workbook);
        // 3在工作簿创建sheet
        HSSFSheet sheet = workbook.createSheet(sheetName);
        // 4,设置sheet
        sheet.setDefaultColumnWidth(25);
        // 5,合并
        CellRangeAddress region1 = new CellRangeAddress(0, 0, 0, 10);
        CellRangeAddress region2 = new CellRangeAddress(1, 1, 0, 10);
        sheet.addMergedRegion(region1);
        sheet.addMergedRegion(region2);
        // 6,创建第一行
        int index = 0;
        HSSFRow row1 = sheet.createRow(index);
        // 6.1在第一行里面创建一个单元格
        HSSFCell row1_cell1 = row1.createCell(0);
        // 6.2设置标题样式
        row1_cell1.setCellStyle(titleStyle);
        // 6.3设置单元格内容
        row1_cell1.setCellValue("客户数据列表");

        // 7,第二行
        index++;
        HSSFRow row2 = sheet.createRow(index);
        // 7.1在第一行里面创建一个单元格
        HSSFCell row2_cell1 = row2.createCell(0);
        // 7.2设置标题样式
        row2_cell1.setCellStyle(subTitleStyle);
        // 7.3设置单元格内容
        SimpleDateFormat sdf = (SimpleDateFormat) DateFormat.getDateTimeInstance();
        row2_cell1.setCellValue("总条数:" + customers.size() + "   导出时间:" + sdf.format(new Date()));

        // 8第三行
        String[] titles =
                {"客户编号", "客户姓名", "客户来源", "客户专业", "客户类型", "联系人", "固话", "手机", "邮政编码", "地址", "创建时间"};
        index++;
        HSSFRow row3 = sheet.createRow(index);
        for (int i = 0; i < titles.length; i++) {
            HSSFCell row3_cell = row3.createCell(i);
            row3_cell.setCellStyle(tableTitleStyle);
            row3_cell.setCellValue(titles[i]);
        }
        // 9第四行
        for (int i = 0; i < customers.size(); i++) {
            index++;
            Customer customer = customers.get(i);
            HSSFRow row = sheet.createRow(index);
            // 9.1创建列客户编号
            HSSFCell row_id = row.createCell(0);
            row_id.setCellStyle(baseStyle);
            row_id.setCellValue(customer.getCustId());
            // 9.2创建列客户姓名
            HSSFCell row_custname = row.createCell(1);
            row_custname.setCellStyle(baseStyle);
            row_custname.setCellValue(customer.getCustName());
            // 9.3创建列客户来源
            HSSFCell row_source = row.createCell(2);
            row_source.setCellStyle(baseStyle);
            row_source.setCellValue(customer.getCustSource());
            // 9.4创建列客户专业
            HSSFCell row_major = row.createCell(3);
            row_major.setCellStyle(baseStyle);
            row_major.setCellValue(customer.getCustMajor());
            // 9.5创建列客户类型
            HSSFCell row_level = row.createCell(4);
            row_level.setCellStyle(baseStyle);
            row_level.setCellValue(customer.getCustLevel() == 1 ? "包年用户" : "包月用户");
            // 9.6创建列联系人
            HSSFCell row_linkman = row.createCell(5);
            row_linkman.setCellStyle(baseStyle);
            row_linkman.setCellValue(customer.getCustLinkman());
            // 9.7创建列固话号
            HSSFCell row_phone = row.createCell(6);
            row_phone.setCellStyle(baseStyle);
            row_phone.setCellValue(customer.getCustPhone());
            // 9.8创建列手机
            HSSFCell row_mobile = row.createCell(7);
            row_mobile.setCellStyle(baseStyle);
            row_mobile.setCellValue(customer.getCustMobile());
            // 9.9创建列邮编
            HSSFCell row_zipcode = row.createCell(8);
            row_zipcode.setCellStyle(baseStyle);
            row_zipcode.setCellValue(customer.getCustLinkman());
            // 9.10创建列地址
            HSSFCell row_address = row.createCell(9);
            row_address.setCellStyle(baseStyle);
            row_address.setCellValue(customer.getCustAddress());
            // 9.11创建列录入时间
            HSSFCell row_createtime = row.createCell(10);
            row_createtime.setCellStyle(baseStyle);
            row_createtime.setCellValue(sdf.format(customer.getCustCreatetime()));
        }
        // 到此excel组装完成

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
