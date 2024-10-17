package thai.dev.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import java.util.List;
import thai.dev.data.model.OrderItem;

public class QRCodeUtil {

    public static String generateQRCodeImage(String qrCodeData) {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        try {
            BitMatrix bitMatrix = qrCodeWriter.encode(qrCodeData, BarcodeFormat.QR_CODE, 300, 300);
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            MatrixToImageWriter.writeToStream(bitMatrix, "PNG", outputStream);
            byte[] qrCodeBytes = outputStream.toByteArray();
            return Base64.getEncoder().encodeToString(qrCodeBytes);
        } catch (WriterException | IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String generateQRCodeData(List<OrderItem> cart) {
        StringBuilder qrData = new StringBuilder("Payment for:\n");
        for (OrderItem item : cart) {
            qrData.append("Product ID: ").append(item.getProductId())
                    .append(", Quantity: ").append(item.getQuantity())
                    .append(", Total Price: ").append(item.getQuantity() * item.getPrice())
                    .append("\n");
        }
        return qrData.toString();
    }

    public static String generateQRCodeData(List<OrderItem> cart, String bankName, String accountNumber) {
        StringBuilder qrData = new StringBuilder("Payment :\n");
        qrData.append("Bank: ").append(bankName).append("\n")
                .append("Account Number: ").append(accountNumber).append("\n");

        for (OrderItem item : cart) {
            qrData.append("Product ID: ").append(item.getProductId())
                    .append(", Quantity: ").append(item.getQuantity())
                    .append(", Total Price: ").append(item.getQuantity() * item.getPrice())
                    .append("\n");
        }
        return qrData.toString();
    }

}
